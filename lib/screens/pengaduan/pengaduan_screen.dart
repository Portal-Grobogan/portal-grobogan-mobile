import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import '../../providers/pengaduan_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_button.dart';
import '../../utils/validators.dart';

class PengaduanScreen extends ConsumerStatefulWidget {
  const PengaduanScreen({super.key});

  @override
  ConsumerState<PengaduanScreen> createState() => _PengaduanScreenState();
}

class _PengaduanScreenState extends ConsumerState<PengaduanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomorHpController = TextEditingController();
  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();
  String _kategori = 'Infrastruktur';
  File? _lampiran;

  final List<String> _kategoriOptions = [
    'Infrastruktur',
    'Kesehatan',
    'Pendidikan',
    'Keamanan',
    'Layanan Publik',
    'Lainnya'
  ];

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _lampiran = File(result.files.single.path!);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    final id = await ref.read(pengaduanProvider.notifier).submitPengaduan(
      nama: _namaController.text,
      email: _emailController.text,
      nik: _nikController.text,
      nomorHp: _nomorHpController.text,
      kategori: _kategori,
      judul: _judulController.text,
      deskripsi: _deskripsiController.text,
      lampiran: _lampiran,
    );

    if (id != null) {
      HapticFeedback.mediumImpact();
      if (mounted) context.go('/pengaduan/sukses/$id');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengirim pengaduan. Coba lagi.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pengaduanState = ref.watch(pengaduanProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Pengaduan', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            Text('Laporkan masalah Anda kepada pemerintah Kabupaten Grobogan. Kami akan menindaklanjuti sesegera mungkin.', style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppDimensions.spacing24),
            
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap *'),
              validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            TextFormField(
              controller: _nikController,
              decoration: const InputDecoration(labelText: 'NIK (Nomor Induk Kependudukan) *'),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Wajib diisi';
                if (v.length != 16) return 'NIK harus 16 digit';
                return null;
              },
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email *'),
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            TextFormField(
              controller: _nomorHpController,
              decoration: const InputDecoration(labelText: 'Nomor HP *'),
              keyboardType: TextInputType.phone,
              validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            DropdownButtonFormField<String>(
              value: _kategori,
              decoration: const InputDecoration(labelText: 'Kategori Laporan *'),
              items: _kategoriOptions.map((k) => DropdownMenuItem(value: k, child: Text(k))).toList(),
              onChanged: (v) => setState(() => _kategori = v!),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul Pengaduan *'),
              validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            TextFormField(
              controller: _deskripsiController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Detail *',
                alignLabelWithHint: true,
              ),
              maxLines: 4,
              validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            
            if (_lampiran != null)
              Container(
                margin: const EdgeInsets.only(bottom: AppDimensions.spacing16),
                padding: const EdgeInsets.all(AppDimensions.spacing12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray200),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.attach_file, color: AppColors.electricBlue),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_lampiran!.path.split('\\').last.split('/').last, overflow: TextOverflow.ellipsis)),
                    IconButton(icon: const Icon(Icons.close, color: AppColors.danger), onPressed: () => setState(() => _lampiran = null)),
                  ],
                ),
              ),
              
            OutlinedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.upload_file),
              label: const Text('Tambah Lampiran (Opsional)'),
              style: OutlinedButton.styleFrom(
                padding: AppDimensions.buttonPadding,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
              ),
            ),
            
            const SizedBox(height: AppDimensions.spacing32),
            
            AppButton(
              label: 'Kirim Pengaduan',
              onPressed: pengaduanState.isLoading ? null : _submit,
              isLoading: pengaduanState.isLoading,
              icon: Icons.send,
            ),
            
            const SizedBox(height: AppDimensions.spacing16),
            
            TextButton(
              onPressed: () => context.push('/pengaduan/cek'),
              child: Text('Sudah lapor? Cek status di sini', style: AppTextStyles.labelMedium.copyWith(color: AppColors.electricBlue)),
            ),
          ],
        ),
      ),
    );
  }
}

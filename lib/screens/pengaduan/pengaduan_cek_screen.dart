import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pengaduan_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_badge.dart';
import '../../widgets/empty_state.dart';

class PengaduanCekScreen extends ConsumerStatefulWidget {
  const PengaduanCekScreen({super.key});

  @override
  ConsumerState<PengaduanCekScreen> createState() => _PengaduanCekScreenState();
}

class _PengaduanCekScreenState extends ConsumerState<PengaduanCekScreen> {
  final _idController = TextEditingController();
  String? _searchedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Status Laporan', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: Column(
        children: [
          Container(
            padding: AppDimensions.screenPadding,
            color: AppColors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _idController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan ID Resi Pengaduan',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (v) {
                      if (v.isNotEmpty) setState(() => _searchedId = v);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                AppButton(
                  label: 'Cek',
                  onPressed: () {
                    if (_idController.text.isNotEmpty) {
                      setState(() => _searchedId = _idController.text);
                    }
                  },
                ),
              ],
            ),
          ),
          
          Expanded(
            child: _searchedId == null
                ? const EmptyState(
                    icon: Icons.search,
                    title: 'Lacak Laporan Anda',
                    description: 'Masukkan ID Resi pengaduan Anda pada kolom di atas untuk mengetahui status penanganan terbaru.',
                  )
                : ref.watch(pengaduanDetailProvider(_searchedId!)).when(
                    data: (pengaduan) {
                      if (pengaduan == null) {
                        return const EmptyState(
                          icon: Icons.search_off,
                          title: 'Laporan tidak ditemukan',
                          description: 'Pastikan ID Resi yang Anda masukkan sudah benar.',
                        );
                      }
                      
                      return ListView(
                        padding: AppDimensions.screenPadding,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                              border: Border.all(color: AppColors.gray200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Status Laporan', style: AppTextStyles.labelMedium.copyWith(color: AppColors.gray500)),
                                    AppBadge.status(pengaduan.status ?? 'diterima'),
                                  ],
                                ),
                                const Divider(height: 32),
                                Text(pengaduan.judul ?? '', style: AppTextStyles.headingLarge),
                                const SizedBox(height: 8),
                                Text(pengaduan.deskripsi ?? '', style: AppTextStyles.bodyMedium),
                                const SizedBox(height: 24),
                                _buildInfoRow('Kategori', pengaduan.kategori ?? ''),
                                _buildInfoRow('Tanggal', pengaduan.createdAt?.toString().split(' ')[0] ?? '-'),
                                _buildInfoRow('Pelapor', pengaduan.namaPelapor ?? ''),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: AppTextStyles.bodySmall),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

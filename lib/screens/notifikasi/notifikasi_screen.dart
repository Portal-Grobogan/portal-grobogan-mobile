import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../providers/notification_store_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class NotifikasiScreen extends ConsumerWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationStoreProvider);
    final notifier = ref.read(notificationStoreProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
        actions: [
          if (notifications.isNotEmpty)
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Hapus Semua?'),
                    content: const Text('Semua riwayat notifikasi akan dihapus secara permanen.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
                      TextButton(
                        onPressed: () {
                          notifier.clearAll();
                          Navigator.pop(ctx);
                        },
                        child: const Text('Hapus', style: TextStyle(color: AppColors.danger)),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Bersihkan'),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off_outlined, size: 80, color: AppColors.gray200),
                  const SizedBox(height: 16),
                  Text('Belum ada notifikasi', style: AppTextStyles.headingLarge.copyWith(color: AppColors.gray500)),
                  const SizedBox(height: 8),
                  Text('Semua pesan penting akan muncul di sini', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray500)),
                ],
              ),
            )
          : ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notif = notifications[index];
                IconData icon;
                Color iconBg;
                Color iconColor;

                switch (notif.type) {
                  case 'bencana':
                    icon = Icons.warning_amber_rounded;
                    iconBg = AppColors.danger.withOpacity(0.1);
                    iconColor = AppColors.danger;
                    break;
                  case 'pengaduan':
                    icon = Icons.assignment_turned_in;
                    iconBg = AppColors.success.withOpacity(0.1);
                    iconColor = AppColors.success;
                    break;
                  case 'berita':
                    icon = Icons.newspaper;
                    iconBg = AppColors.electricBlue.withOpacity(0.1);
                    iconColor = AppColors.electricBlue;
                    break;
                  default:
                    icon = Icons.notifications;
                    iconBg = AppColors.gray200;
                    iconColor = AppColors.gray500;
                }

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16, vertical: AppDimensions.spacing12),
                  tileColor: notif.isRead ? AppColors.white : AppColors.electricBlue.withOpacity(0.05),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                    child: Icon(icon, color: iconColor, size: 24),
                  ),
                  title: Text(
                    notif.title,
                    style: AppTextStyles.labelMedium.copyWith(
                      fontWeight: notif.isRead ? FontWeight.w500 : FontWeight.w700,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(notif.body, style: AppTextStyles.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 8),
                      Text(
                        DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(notif.timestamp),
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  onTap: () {
                    if (!notif.isRead) {
                      notifier.markAsRead(notif.id);
                    }
                    
                    // Route to specific page if needed
                    if (notif.type == 'bencana') {
                      context.push('/layanan/kebencanaan');
                    } else if (notif.type == 'berita') {
                      if (notif.slug != null) {
                        context.push('/berita/${notif.slug}');
                      } else {
                        context.go('/berita');
                      }
                    } else if (notif.type == 'pengaduan') {
                      context.push('/pengaduan/cek');
                    }
                  },
                );
              },
            ),
    );
  }
}

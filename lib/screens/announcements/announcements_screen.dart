import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/dummy_data.dart';
import '../../models/announcement.dart';
import '../../theme/app_theme.dart';
import '../../widgets/announcement_card.dart';
import 'announcement_detail_screen.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  String _selectedCategory = 'All';

  List<String> get _categories {
    final cats = DummyData.announcements.map((a) => a.category).toSet().toList();
    cats.sort();
    return ['All', ...cats];
  }

  List<Announcement> get _filtered {
    if (_selectedCategory == 'All') return DummyData.announcements;
    return DummyData.announcements
        .where((a) => a.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter chips
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            itemCount: _categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final cat = _categories[i];
              final selected = cat == _selectedCategory;
              return FilterChip(
                label: Text(cat),
                selected: selected,
                onSelected: (_) => setState(() => _selectedCategory = cat),
                selectedColor: AppTheme.primary.withValues(alpha: 0.15),
                checkmarkColor: AppTheme.primary,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? AppTheme.primary : Colors.grey[600],
                ),
              );
            },
          ),
        ),
        // Count
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 16, 0),
          child: Text(
            '${_filtered.length} announcement${_filtered.length == 1 ? '' : 's'}',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500]),
          ),
        ),
        // List
        Expanded(
          child: _filtered.isEmpty
              ? Center(
                  child: Text('No announcements',
                      style: GoogleFonts.poppins(color: Colors.grey)),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  itemCount: _filtered.length,
                  itemBuilder: (context, i) {
                    final a = _filtered[i];
                    return AnnouncementCard(
                      announcement: a,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              AnnouncementDetailScreen(announcement: a),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/dummy_data.dart';
import '../../models/club.dart';
import '../../theme/app_theme.dart';
import '../../widgets/club_card.dart';
import 'club_detail_screen.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  String _selectedCategory = 'All';

  List<String> get _categories {
    final cats = DummyData.clubs.map((c) => c.category).toSet().toList();
    cats.sort();
    return ['All', ...cats];
  }

  List<Club> get _filtered {
    if (_selectedCategory == 'All') return DummyData.clubs;
    return DummyData.clubs
        .where((c) => c.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final joined = DummyData.clubs.where((c) => c.isJoined).length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "You're in X clubs" banner
        if (joined > 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified_rounded,
                      color: AppTheme.primary, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "You're in $joined club${joined > 1 ? 's' : ''}",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        // List
        Expanded(
          child: _filtered.isEmpty
              ? Center(
                  child: Text('No clubs',
                      style: GoogleFonts.poppins(color: Colors.grey)),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 4, bottom: 20),
                  itemCount: _filtered.length,
                  itemBuilder: (context, i) {
                    final club = _filtered[i];
                    return ClubCard(
                      club: club,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClubDetailScreen(club: club),
                        ),
                      ).then((_) => setState(() {})),
                      onJoinToggle: () => setState(() {
                        club.isJoined = !club.isJoined;
                        club.memberCount += club.isJoined ? 1 : -1;
                      }),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/club.dart';
import '../../theme/app_theme.dart';

class ClubDetailScreen extends StatefulWidget {
  final Club club;
  const ClubDetailScreen({super.key, required this.club});

  @override
  State<ClubDetailScreen> createState() => _ClubDetailScreenState();
}

class _ClubDetailScreenState extends State<ClubDetailScreen> {
  late bool _isJoined;
  late int _memberCount;

  @override
  void initState() {
    super.initState();
    _isJoined = widget.club.isJoined;
    _memberCount = widget.club.memberCount;
  }

  void _toggleJoin() {
    setState(() {
      _isJoined = !_isJoined;
      widget.club.isJoined = _isJoined;
      _memberCount = _isJoined ? _memberCount + 1 : _memberCount - 1;
      widget.club.memberCount = _memberCount;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isJoined
              ? '🎉 You joined ${widget.club.name}!'
              : 'You left ${widget.club.name}.',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: _isJoined ? Colors.green[700] : Colors.grey[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final club = widget.club;
    final catColor = AppTheme.categoryColor(club.category);
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [catColor.withValues(alpha: 0.8), AppTheme.primary],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(club.iconEmoji,
                          style: const TextStyle(fontSize: 56)),
                      const SizedBox(height: 8),
                      Text(
                        club.name,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: catColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          club.category,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: catColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.people_outline_rounded,
                          size: 16, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        '$_memberCount members',
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _infoRow(Icons.person_outline_rounded, 'Club Lead', club.lead),
                  const SizedBox(height: 20),
                  Divider(color: Colors.grey[200]),
                  const SizedBox(height: 16),
                  Text(
                    'About the Club',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[850],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    club.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _toggleJoin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isJoined ? Colors.grey[200] : AppTheme.primary,
                        foregroundColor:
                            _isJoined ? Colors.grey[700] : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: _isJoined ? 0 : 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isJoined
                                ? Icons.exit_to_app_rounded
                                : Icons.group_add_rounded,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isJoined ? 'Leave Club' : 'Join this Club',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.primary),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

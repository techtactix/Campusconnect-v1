import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/event.dart';
import '../../theme/app_theme.dart';

class EventDetailScreen extends StatefulWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late bool _isRegistered;

  @override
  void initState() {
    super.initState();
    _isRegistered = widget.event.isRegistered;
  }

  void _toggleRegistration() {
    setState(() {
      _isRegistered = !_isRegistered;
      widget.event.isRegistered = _isRegistered;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isRegistered
              ? '✅ Registered for ${widget.event.title}!'
              : 'Registration cancelled.',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: _isRegistered ? Colors.green[700] : Colors.grey[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final catColor = AppTheme.categoryColor(event.category);
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.primary, AppTheme.primaryLight],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: catColor.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          event.category,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
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
                  Text(
                    event.title,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _infoRow(Icons.calendar_today_outlined,
                      DateFormat('EEEE, d MMMM yyyy').format(event.dateTime)),
                  const SizedBox(height: 8),
                  _infoRow(Icons.access_time_rounded,
                      DateFormat('h:mm a').format(event.dateTime)),
                  const SizedBox(height: 8),
                  _infoRow(Icons.location_on_outlined, event.location),
                  const SizedBox(height: 8),
                  _infoRow(Icons.person_outline_rounded,
                      'Organized by ${event.organizer}'),
                  const SizedBox(height: 20),
                  Divider(color: Colors.grey[200]),
                  const SizedBox(height: 20),
                  Text(
                    'About this Event',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[850],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    event.description,
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
                      onPressed: _toggleRegistration,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isRegistered ? Colors.grey[200] : AppTheme.accent,
                        foregroundColor:
                            _isRegistered ? Colors.grey[700] : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: _isRegistered ? 0 : 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isRegistered
                                ? Icons.check_circle_outline_rounded
                                : Icons.how_to_reg_rounded,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isRegistered
                                ? 'Registered — Tap to Cancel'
                                : 'Register for this Event',
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

  Widget _infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppTheme.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}

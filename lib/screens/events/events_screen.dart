import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/dummy_data.dart';
import '../../models/event.dart';
import '../../theme/app_theme.dart';
import '../../widgets/event_card.dart';
import 'event_detail_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String _selectedCategory = 'All';

  List<String> get _categories {
    final cats = DummyData.events.map((e) => e.category).toSet().toList();
    cats.sort();
    return ['All', ...cats];
  }

  List<Event> get _filtered {
    if (_selectedCategory == 'All') return DummyData.events;
    return DummyData.events
        .where((e) => e.category == _selectedCategory)
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
        // List
        Expanded(
          child: _filtered.isEmpty
              ? Center(
                  child: Text('No events',
                      style: GoogleFonts.poppins(color: Colors.grey)),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  itemCount: _filtered.length,
                  itemBuilder: (context, i) {
                    final event = _filtered[i];
                    return EventCard(
                      event: event,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EventDetailScreen(event: event),
                        ),
                      ).then((_) => setState(() {})),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

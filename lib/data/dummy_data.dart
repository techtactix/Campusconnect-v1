import '../models/announcement.dart';
import '../models/event.dart';
import '../models/club.dart';

class DummyData {
  static List<Announcement> announcements = [
    Announcement(
      id: 'a1',
      title: 'Mid-Semester Exams Schedule Released',
      body:
          'The mid-semester examination schedule has been officially released by the examination cell. All students are advised to check their timetables on the student portal. Exams begin from December 5th. Hall tickets must be collected from the department office by December 1st. No candidate will be allowed without a valid hall ticket.',
      category: 'Exams',
      date: DateTime(2026, 11, 18),
      isImportant: true,
    ),
    Announcement(
      id: 'a2',
      title: 'Library Extended Hours During Exam Season',
      body:
          'The central library will remain open until midnight from November 25th to December 20th to support students during the examination period. Students must carry their ID cards. Silent study zones have been designated on floors 2 and 3.',
      category: 'Facility',
      date: DateTime(2026, 11, 17),
    ),
    Announcement(
      id: 'a3',
      title: 'Scholarship Applications Now Open',
      body:
          'Applications for the Merit-cum-Means scholarship for the academic year 2026–27 are now open. Eligible students (income below ₹8 LPA, CGPA above 7.5) can apply via the student portal. Last date: December 10, 2026. Shortlisted candidates will be called for verification.',
      category: 'Scholarship',
      date: DateTime(2026, 11, 15),
      isImportant: true,
    ),
    Announcement(
      id: 'a4',
      title: 'Campus Wi-Fi Maintenance — Nov 22',
      body:
          'The campus Wi-Fi network will undergo scheduled maintenance on November 22nd from 2:00 AM to 6:00 AM. Services will be temporarily unavailable during this window. The IT department apologizes for the inconvenience.',
      category: 'IT',
      date: DateTime(2026, 11, 14),
    ),
    Announcement(
      id: 'a5',
      title: 'Anti-Ragging Policy Reminder',
      body:
          'All students are reminded that ragging in any form — physical, verbal, or online — is strictly prohibited and punishable under law. Students can report incidents anonymously via the college helpline: 1800-XXX-XXXX or email antiragging@college.edu.',
      category: 'Policy',
      date: DateTime(2026, 11, 12),
      isImportant: true,
    ),
    Announcement(
      id: 'a6',
      title: 'Guest Lecture: AI in Healthcare',
      body:
          'A guest lecture by Dr. Priya Nair, Research Scientist at Google Health, will be held on November 28th at 10:00 AM in the Main Auditorium. The talk will cover the intersection of artificial intelligence and modern healthcare diagnostics. All CSE and IT students are encouraged to attend.',
      category: 'Academic',
      date: DateTime(2026, 11, 11),
    ),
  ];

  static List<Event> events = [
    Event(
      id: 'e1',
      title: 'TechFest 2026',
      description:
          'TechFest is the annual technology festival of the college bringing together the brightest minds for competitions, workshops, and talks. This year features hackathons, robotics battles, paper presentations, and a keynote by industry leaders. Register your team and compete for prizes worth ₹2,00,000.',
      location: 'Main Campus Ground & Auditorium',
      dateTime: DateTime(2026, 12, 10, 9, 0),
      organizer: 'IEEE Student Chapter',
      category: 'Technical',
      imageAsset: 'assets/images/event_tech.png',
    ),
    Event(
      id: 'e2',
      title: 'Freshers\' Welcome Night',
      description:
          'The annual welcome party for the new batch! An evening filled with music, dance, and fun activities. Senior students and faculty will be present to welcome the freshers. Dress code: Festive. Dinner will be provided.',
      location: 'Open Air Theatre',
      dateTime: DateTime(2026, 11, 25, 18, 30),
      organizer: 'Student Council',
      category: 'Cultural',
      imageAsset: 'assets/images/event_cultural.png',
    ),
    Event(
      id: 'e3',
      title: 'Resume & LinkedIn Workshop',
      description:
          'A hands-on workshop to help students build job-ready resumes and professional LinkedIn profiles. Conducted by the placement cell with support from alumni working at top companies. Bring your laptop. Limited seats — first come, first served.',
      location: 'Seminar Hall B, Block 3',
      dateTime: DateTime(2026, 11, 28, 10, 0),
      organizer: 'Placement Cell',
      category: 'Career',
      imageAsset: 'assets/images/event_career.png',
    ),
    Event(
      id: 'e4',
      title: 'Inter-College Cricket Tournament',
      description:
          'The annual inter-college cricket tournament is here! Teams from 12 colleges will compete over 3 days for the Rolling Trophy. Come support your college team. Entry is free for all students.',
      location: 'College Cricket Ground',
      dateTime: DateTime(2026, 12, 5, 8, 0),
      organizer: 'Sports Committee',
      category: 'Sports',
      imageAsset: 'assets/images/event_sports.png',
    ),
    Event(
      id: 'e5',
      title: 'Photography Walk — Campus Edition',
      description:
          'Explore the campus through a lens! Join the Photography Club for a morning walk where participants capture the best moments. Judges will select top 10 photos for the annual magazine. Any camera or phone allowed.',
      location: 'Meet at Main Gate',
      dateTime: DateTime(2026, 11, 30, 7, 0),
      organizer: 'Photography Club',
      category: 'Cultural',
      imageAsset: 'assets/images/event_cultural.png',
    ),
  ];

  static List<Club> clubs = [
    Club(
      id: 'c1',
      name: 'IEEE Student Chapter',
      description:
          'The IEEE Student Chapter promotes technical excellence and innovation. We organize workshops, hackathons, and guest lectures on cutting-edge technology. Members get access to IEEE digital library, certifications, and global networking opportunities.',
      category: 'Technical',
      lead: 'Arjun Mehta',
      memberCount: 142,
      iconEmoji: '⚡',
    ),
    Club(
      id: 'c2',
      name: 'Debate & Oratory Society',
      description:
          'Sharpen your public speaking and critical thinking skills. We host weekly debate sessions, MUNs, elocution competitions, and participate in inter-college events. No prior experience required — just a willingness to speak up!',
      category: 'Literary',
      lead: 'Sneha Reddy',
      memberCount: 78,
      iconEmoji: '🎤',
    ),
    Club(
      id: 'c3',
      name: 'Entrepreneurship Cell',
      description:
          'The E-Cell connects aspiring entrepreneurs with mentors, investors, and resources. We run startup weekends, pitch competitions, and workshops on ideation, funding, and growth. If you have an idea, we help you build it.',
      category: 'Business',
      lead: 'Rahul Sharma',
      memberCount: 95,
      iconEmoji: '🚀',
    ),
    Club(
      id: 'c4',
      name: 'NSS — National Service Scheme',
      description:
          'NSS is a government-sponsored public service program. We engage in community service, blood donation drives, environmental campaigns, and rural outreach. Participation earns you activity points and a certificate recognized nationally.',
      category: 'Social',
      lead: 'Divya Krishnan',
      memberCount: 210,
      iconEmoji: '🤝',
    ),
    Club(
      id: 'c5',
      name: 'Photography Club',
      description:
          'A creative space for photography enthusiasts! We organize photo walks, studio sessions, workshops on editing tools like Lightroom and Photoshop, and competitions. Your work gets featured in the college magazine and social media.',
      category: 'Creative',
      lead: 'Riya Joshi',
      memberCount: 64,
      iconEmoji: '📷',
    ),
    Club(
      id: 'c6',
      name: 'CodeCraft — Competitive Programming',
      description:
          'CodeCraft is for coders who love to compete. We practice on Codeforces, LeetCode, and HackerRank, and train for ICPC and other competitions. Weekly problem sessions, editorial discussions, and mock contests keep you sharp.',
      category: 'Technical',
      lead: 'Karan Patel',
      memberCount: 120,
      iconEmoji: '💻',
    ),
  ];
}

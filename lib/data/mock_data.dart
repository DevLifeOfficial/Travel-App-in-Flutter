import '../models/travel_package.dart';
import '../models/hotel.dart';
import '../models/tourist_place.dart';
import '../models/review.dart';

// ─── TRAVEL PACKAGES ────────────────────────────────────────────────────────

final List<TravelPackage> mockPackages = [
  const TravelPackage(
    id: 'pkg_001',
    title: 'Golden Triangle Explorer',
    destination: 'Delhi – Agra – Jaipur',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800',
      'https://images.unsplash.com/photo-1548013146-72479768bada?w=800',
      'https://images.unsplash.com/photo-1477587458883-47145ed31803?w=800',
    ],
    pricePerPerson: 28999,
    durationDays: 6,
    durationNights: 5,
    rating: 4.8,
    reviewCount: 342,
    category: 'Cultural',
    inclusions: [
      'Accommodation (5-star hotels)',
      'All meals (breakfast & dinner)',
      'AC private cab with driver',
      'Taj Mahal entry tickets',
      'Professional English guide',
      'Airport transfers',
    ],
    exclusions: [
      'Flights to Delhi / from Jaipur',
      'Personal expenses',
      'Camera fees at monuments',
      'Tips & gratuities',
    ],
    highlights: [
      'Sunrise view of Taj Mahal',
      'Amber Fort elephant ride',
      'Old Delhi rickshaw tour',
      'Jaipur city palace walk',
    ],
    description:
        'Discover India\'s iconic Golden Triangle — the sprawling capital Delhi, '
        'the timeless wonder of Agra\'s Taj Mahal, and the Pink City of Jaipur. '
        'A perfectly curated cultural immersion into Mughal grandeur and Rajput splendour.',
    isFeatured: true,
    isPopular: true,
    maxGroupSize: 12,
    difficulty: 'Easy',
    bestSeason: 'Oct – Mar',
  ),

  const TravelPackage(
    id: 'pkg_002',
    title: 'Kerala Backwaters Bliss',
    destination: 'Kochi – Alleppey – Munnar',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=800',
      'https://images.unsplash.com/photo-1590123716060-8e4c524f2741?w=800',
      'https://images.unsplash.com/photo-1544979590-37e9b47eb705?w=800',
    ],
    pricePerPerson: 22500,
    durationDays: 5,
    durationNights: 4,
    rating: 4.9,
    reviewCount: 519,
    category: 'Beach',
    inclusions: [
      'Houseboat stay (AC deluxe)',
      'Breakfast & dinner daily',
      'All transfers & sightseeing',
      'Spice plantation visit',
      'Kathakali dance show',
    ],
    exclusions: ['Airfare', 'Lunch', 'Personal shopping'],
    highlights: [
      'Overnight houseboat on backwaters',
      'Munnar tea estate walk',
      'Chinese fishing nets at Kochi',
      'Ayurvedic spa treatment',
    ],
    description:
        'Glide through tranquil backwater canals on a traditional houseboat, '
        'wake up to misty Munnar tea estates, and explore the colonial charm '
        'of Fort Kochi. God\'s Own Country at its finest.',
    isFeatured: true,
    isPopular: true,
    maxGroupSize: 8,
    difficulty: 'Easy',
    bestSeason: 'Sep – Mar',
  ),

  const TravelPackage(
    id: 'pkg_003',
    title: 'Manali Snow Adventure',
    destination: 'Delhi – Manali – Solang Valley',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23?w=800',
      'https://images.unsplash.com/photo-1571406383055-6f0bad3a0ff8?w=800',
      'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
    ],
    pricePerPerson: 18750,
    durationDays: 7,
    durationNights: 6,
    rating: 4.6,
    reviewCount: 278,
    category: 'Adventure',
    inclusions: [
      'Hotel accommodation (3-star)',
      'Daily breakfast',
      'Volvo bus Delhi–Manali–Delhi',
      'Solang Valley snow activities',
      'Rohtang Pass day trip',
      'Hadimba temple visit',
    ],
    exclusions: [
      'Lunch & dinner',
      'Snow activity gear rental',
      'Personal expenses',
    ],
    highlights: [
      'Rohtang Pass at 3,978 m',
      'Skiing at Solang Valley',
      'River crossing adventure',
      'Campfire & bonfire nights',
    ],
    description:
        'Escape to the snowy Himalayas for a thrill-packed adventure. '
        'Ski down slopes, zip-line over valleys, trek through alpine meadows, '
        'and warm up by a bonfire under a million stars.',
    isFeatured: false,
    isPopular: true,
    maxGroupSize: 20,
    difficulty: 'Moderate',
    bestSeason: 'Dec – Feb',
  ),

  const TravelPackage(
    id: 'pkg_004',
    title: 'Rajasthan Royal Heritage',
    destination: 'Jodhpur – Udaipur – Pushkar',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1599661046289-e31897846e41?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1599661046289-e31897846e41?w=800',
      'https://images.unsplash.com/photo-1567157577867-05ccb1388e66?w=800',
      'https://images.unsplash.com/photo-1618245318763-a15156d6b23c?w=800',
    ],
    pricePerPerson: 35000,
    durationDays: 8,
    durationNights: 7,
    rating: 4.7,
    reviewCount: 203,
    category: 'Luxury',
    inclusions: [
      'Heritage palace hotels',
      'All meals included',
      'Camel safari in Thar desert',
      'Desert camp overnight',
      'Folk dance performance',
      'Vintage car ride',
    ],
    exclusions: ['Flights', 'Alcoholic beverages', 'Tips'],
    highlights: [
      'Mehrangarh Fort panorama',
      'Boat ride on Lake Pichola',
      'Desert camp under stars',
      'Pushkar camel fair (seasonal)',
    ],
    description:
        'Live like royalty across Rajasthan\'s most majestic cities. '
        'Palace hotels, golden desert dunes, royal cuisines, '
        'and centuries of history — this is the ultimate Indian luxury experience.',
    isFeatured: true,
    isPopular: false,
    maxGroupSize: 10,
    difficulty: 'Easy',
    bestSeason: 'Oct – Feb',
  ),

  const TravelPackage(
    id: 'pkg_005',
    title: 'Andaman Island Escape',
    destination: 'Port Blair – Havelock – Neil Island',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=800',
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    ],
    pricePerPerson: 26500,
    durationDays: 6,
    durationNights: 5,
    rating: 4.8,
    reviewCount: 387,
    category: 'Beach',
    inclusions: [
      'Beach resort stay',
      'Ferry transfers between islands',
      'Scuba diving (2 dives)',
      'Snorkelling gear',
      'Cellular Jail light & sound show',
      'Daily breakfast',
    ],
    exclusions: ['Airfare to Port Blair', 'Lunch & dinner', 'Optional water sports'],
    highlights: [
      'Radhanagar Beach (Asia\'s best)',
      'Scuba diving in crystal waters',
      'Glass-bottom boat tour',
      'Cellular Jail tour',
    ],
    description:
        'Crystal-clear turquoise waters, powdery white sand beaches, '
        'and a vibrant coral reef ecosystem make the Andamans India\'s '
        'most breathtaking island getaway.',
    isFeatured: false,
    isPopular: true,
    maxGroupSize: 15,
    difficulty: 'Easy',
    bestSeason: 'Nov – May',
  ),

  const TravelPackage(
    id: 'pkg_006',
    title: 'Northeast India Explorer',
    destination: 'Guwahati – Shillong – Cherrapunji',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1586187280316-eb48b6a3673e?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1586187280316-eb48b6a3673e?w=800',
      'https://images.unsplash.com/photo-1600881070442-5f3a1e4ab4b0?w=800',
      'https://images.unsplash.com/photo-1616401784845-180882ba9ba8?w=800',
    ],
    pricePerPerson: 15999,
    durationDays: 5,
    durationNights: 4,
    rating: 4.5,
    reviewCount: 142,
    category: 'Adventure',
    inclusions: [
      'Hotel stay (3-star)',
      'Daily breakfast & dinner',
      'All sightseeing transfers',
      'Kaziranga safari',
      'Living root bridge trek',
    ],
    exclusions: ['Airfare', 'Lunch', 'Camera fees'],
    highlights: [
      'Double Decker Living Root Bridge',
      'Elephant safari in Kaziranga',
      'Nohkalikai Falls',
      'Scotland of the East — Shillong',
    ],
    description:
        'Explore India\'s green paradise — cascading waterfalls, living root bridges, '
        'lush hills, and the famous one-horned rhinoceros. '
        'A soul-refreshing escape into untouched nature.',
    isFeatured: false,
    isPopular: false,
    maxGroupSize: 16,
    difficulty: 'Moderate',
    bestSeason: 'Oct – Apr',
  ),
];

// ─── HOTELS ─────────────────────────────────────────────────────────────────

final List<Hotel> mockHotels = [
  const Hotel(
    id: 'htl_001',
    name: 'The Taj Mahal Palace',
    city: 'Mumbai',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
      'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
      'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
    ],
    pricePerNight: 18500,
    rating: 4.9,
    reviewCount: 1842,
    starRating: 5,
    amenities: ['Infinity Pool', 'Spa', 'Gym', 'Fine Dining', 'Butler Service', 'Beach Access', 'Concierge'],
    description:
        'An iconic Mumbai landmark since 1903. The Taj Mahal Palace offers unmatched '
        'luxury overlooking the Gateway of India and the Arabian Sea.',
    address: 'Apollo Bunder, Colaba, Mumbai – 400001',
    latitude: 18.9220,
    longitude: 72.8347,
    hasPool: true,
    hasSpa: true,
    hasGym: true,
    isFreeBreakfast: true,
    isRefundable: true,
    roomType: 'Suite',
  ),

  const Hotel(
    id: 'htl_002',
    name: 'Samode Palace',
    city: 'Jaipur',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800',
      'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
    ],
    pricePerNight: 12750,
    rating: 4.8,
    reviewCount: 677,
    starRating: 5,
    amenities: ['Heritage Pool', 'Ayurvedic Spa', 'Rooftop Dining', 'Elephant Ride', 'Cultural Performances'],
    description:
        'A 475-year-old heritage palace with hand-painted walls, royal suites, '
        'and Mughal gardens. The epitome of Rajasthani royal living.',
    address: 'Samode Village, Chomu Tehsil, Jaipur – 303806',
    latitude: 27.3004,
    longitude: 75.5768,
    hasPool: true,
    hasSpa: true,
    hasGym: false,
    isFreeBreakfast: true,
    isRefundable: false,
    roomType: 'Suite',
  ),

  const Hotel(
    id: 'htl_003',
    name: 'Emerald Isle Backwater Resort',
    city: 'Alleppey',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800',
      'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?w=800',
    ],
    pricePerNight: 5500,
    rating: 4.6,
    reviewCount: 412,
    starRating: 4,
    amenities: ['Backwater View', 'Ayurvedic Massage', 'Canoe Ride', 'Organic Restaurant', 'Cycling'],
    description:
        'Nestled on a private island in the Kerala backwaters, this eco-friendly '
        'resort offers genuine village life with luxury comfort.',
    address: 'Muhamma, Alleppey – 688525, Kerala',
    latitude: 9.4200,
    longitude: 76.3950,
    hasPool: false,
    hasSpa: true,
    hasGym: false,
    isFreeBreakfast: true,
    isRefundable: true,
    roomType: 'Villa',
  ),

  const Hotel(
    id: 'htl_004',
    name: 'Snow Peak Retreat',
    city: 'Manali',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
      'https://images.unsplash.com/photo-1455587734955-081b22074882?w=800',
    ],
    pricePerNight: 4200,
    rating: 4.4,
    reviewCount: 293,
    starRating: 3,
    amenities: ['Mountain View', 'Bonfire', 'Trekking Guide', 'Heater Rooms', 'Café'],
    description:
        'A cosy mountain retreat with panoramic Himalayan views. '
        'Perfect for adventure seekers and nature lovers.',
    address: 'Old Manali Road, Manali – 175131, Himachal Pradesh',
    latitude: 32.2432,
    longitude: 77.1892,
    hasPool: false,
    hasSpa: false,
    hasGym: true,
    isFreeBreakfast: true,
    isRefundable: true,
    roomType: 'Deluxe',
  ),

  const Hotel(
    id: 'htl_005',
    name: 'Barefoot at Havelock',
    city: 'Havelock Island',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=800',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    ],
    pricePerNight: 8900,
    rating: 4.7,
    reviewCount: 508,
    starRating: 4,
    amenities: ['Private Beach', 'Dive Center', 'Water Sports', 'Beach Bar', 'Infinity Pool'],
    description:
        'Eco-luxe beach cottages right on Radhanagar Beach — '
        'Asia\'s most beautiful beach. Barefoot luxury at its finest.',
    address: 'Radhanagar Beach, Havelock Island, Andaman – 744211',
    latitude: 11.9810,
    longitude: 92.9840,
    hasPool: true,
    hasSpa: true,
    hasGym: false,
    isFreeBreakfast: false,
    isRefundable: true,
    roomType: 'Villa',
  ),
];

// ─── TOURIST PLACES ─────────────────────────────────────────────────────────

final List<TouristPlace> mockPlaces = [
  const TouristPlace(
    id: 'plc_001',
    name: 'Taj Mahal',
    city: 'Agra',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800',
      'https://images.unsplash.com/photo-1548013146-72479768bada?w=800',
    ],
    rating: 4.9,
    reviewCount: 12840,
    category: 'Heritage',
    description:
        'A UNESCO World Heritage Site and one of the Seven Wonders of the World. '
        'Built by Mughal Emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal, '
        'this ivory-white marble mausoleum is a timeless symbol of eternal love.',
    openingHours: 'Sunrise to Sunset (Closed Fridays)',
    entryFee: '₹50 (Indians) / ₹1,300 (Foreigners)',
    bestTimeToVisit: ['Sunrise', 'Winter months (Oct–Feb)', 'Full moon nights'],
    nearbyAttractions: ['Agra Fort', 'Fatehpur Sikri', 'Mehtab Bagh'],
    isUNESCO: true,
    latitude: 27.1751,
    longitude: 78.0421,
    visitDurationMinutes: 150,
  ),

  const TouristPlace(
    id: 'plc_002',
    name: 'Varanasi Ghats',
    city: 'Varanasi',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1561361058-c24e01b352f2?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1561361058-c24e01b352f2?w=800',
      'https://images.unsplash.com/photo-1567337710282-00832b415979?w=800',
    ],
    rating: 4.7,
    reviewCount: 7230,
    category: 'Religious',
    description:
        'One of the world\'s oldest inhabited cities. The sacred ghats along the '
        'Ganges offer an unforgettable experience of Hindu rituals, '
        'the mesmerising Ganga Aarti ceremony, and a deep connection to ancient spirituality.',
    openingHours: '24 Hours (Ganga Aarti at 7:00 PM)',
    entryFee: 'Free',
    bestTimeToVisit: ['Early morning boat ride', 'Evening Aarti (6–8 PM)', 'Dev Deepawali festival'],
    nearbyAttractions: ['Kashi Vishwanath Temple', 'Sarnath', 'Ramnagar Fort'],
    isUNESCO: false,
    latitude: 25.3176,
    longitude: 83.0062,
    visitDurationMinutes: 180,
  ),

  const TouristPlace(
    id: 'plc_003',
    name: 'Hampi Ruins',
    city: 'Hampi',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1587474260584-136574528ed5?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1587474260584-136574528ed5?w=800',
      'https://images.unsplash.com/photo-1608041301546-e6393eff73e1?w=800',
    ],
    rating: 4.8,
    reviewCount: 4510,
    category: 'Heritage',
    description:
        'A UNESCO World Heritage Site — the ruins of Vijayanagara, '
        'once one of the world\'s largest cities. Boulder-strewn landscapes, '
        'ancient temples, and a magical atmosphere make Hampi truly otherworldly.',
    openingHours: '6:00 AM – 6:00 PM',
    entryFee: '₹40 (Indians) / ₹600 (Foreigners)',
    bestTimeToVisit: ['Oct – Feb', 'Early morning for golden hour', 'Hampi Utsav festival'],
    nearbyAttractions: ['Virupaksha Temple', 'Vittala Temple', 'Lotus Mahal'],
    isUNESCO: true,
    latitude: 15.3350,
    longitude: 76.4600,
    visitDurationMinutes: 300,
  ),

  const TouristPlace(
    id: 'plc_004',
    name: 'Radhanagar Beach',
    city: 'Havelock Island',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
    ],
    rating: 4.9,
    reviewCount: 5320,
    category: 'Beach',
    description:
        'Rated by Time magazine as Asia\'s best beach. '
        'Powdery white sand, crystal-clear turquoise water, lush green forest backdrop, '
        'and spectacular sunsets make this paradise beach truly unforgettable.',
    openingHours: 'Sunrise to Sunset',
    entryFee: 'Free (₹50 forest entry fee)',
    bestTimeToVisit: ['Sunrise & sunset', 'Nov – May (best weather)', 'Sea turtle nesting season'],
    nearbyAttractions: ['Elephant Beach', 'Kalapathar Beach', 'Neil Island'],
    isUNESCO: false,
    latitude: 11.9810,
    longitude: 92.9440,
    visitDurationMinutes: 240,
  ),

  const TouristPlace(
    id: 'plc_005',
    name: 'Nohkalikai Falls',
    city: 'Cherrapunji',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?w=800',
      'https://images.unsplash.com/photo-1460627390041-532a28402358?w=800',
    ],
    rating: 4.6,
    reviewCount: 2108,
    category: 'Nature',
    description:
        'India\'s tallest plunge waterfall at 340 metres, surrounded by dramatic '
        'green cliffs and mist. Named after the tragic legend of Ka Likai, '
        'the falls plunge into an emerald-green pool of breathtaking beauty.',
    openingHours: '7:00 AM – 5:00 PM',
    entryFee: '₹20',
    bestTimeToVisit: ['Jun – Sep (full flow)', 'Morning hours', 'Post-monsoon (Oct–Nov)'],
    nearbyAttractions: ['Double Decker Root Bridge', 'Mawsmai Cave', 'Seven Sisters Falls'],
    isUNESCO: false,
    latitude: 25.2966,
    longitude: 91.7110,
    visitDurationMinutes: 120,
  ),

  const TouristPlace(
    id: 'plc_006',
    name: 'Mehrangarh Fort',
    city: 'Jodhpur',
    country: 'India',
    imageUrl: 'https://images.unsplash.com/photo-1599661046289-e31897846e41?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1599661046289-e31897846e41?w=800',
      'https://images.unsplash.com/photo-1567157577867-05ccb1388e66?w=800',
    ],
    rating: 4.8,
    reviewCount: 6780,
    category: 'Heritage',
    description:
        'One of India\'s largest forts, soaring 400 feet above the Blue City of Jodhpur. '
        'Built in 1459, it houses magnificent palaces with intricate carvings '
        'and India\'s finest museum of royal artifacts.',
    openingHours: '9:00 AM – 5:00 PM',
    entryFee: '₹100 (Indians) / ₹600 (Foreigners)',
    bestTimeToVisit: ['Oct – Mar', 'Early morning', 'Jodhpur Riff Music Festival'],
    nearbyAttractions: ['Umaid Bhawan Palace', 'Jaswant Thada', 'Clock Tower Market'],
    isUNESCO: false,
    latitude: 26.2975,
    longitude: 73.0186,
    visitDurationMinutes: 180,
  ),
];

// ─── REVIEWS ────────────────────────────────────────────────────────────────

final List<Review> mockReviews = [
  Review(
    id: 'rev_001',
    authorName: 'Priya Sharma',
    authorAvatar: '',
    rating: 5.0,
    comment:
        'Absolutely magical trip! The Golden Triangle package was flawlessly organised. '
        'Watching the Taj Mahal at sunrise was a moment I\'ll treasure forever. '
        'Our guide Rajan was exceptional — knowledgeable and warm.',
    date: DateTime.now().subtract(const Duration(days: 14)),
    itemId: 'pkg_001',
    itemType: 'package',
  ),
  Review(
    id: 'rev_002',
    authorName: 'Arjun Mehta',
    authorAvatar: '',
    rating: 4.5,
    comment:
        'The Kerala backwaters experience was surreal. Waking up on the houseboat '
        'to mist rising off the water was pure poetry. Highly recommend adding '
        'an Ayurvedic massage to your itinerary!',
    date: DateTime.now().subtract(const Duration(days: 30)),
    itemId: 'pkg_002',
    itemType: 'package',
  ),
  Review(
    id: 'rev_003',
    authorName: 'Divya Nair',
    authorAvatar: '',
    rating: 5.0,
    comment:
        'The Taj Mahal is even more breathtaking in person than in any photo. '
        'The early morning visit beat the crowds and the light was perfect. '
        'Must do for every traveller visiting India.',
    date: DateTime.now().subtract(const Duration(days: 7)),
    itemId: 'plc_001',
    itemType: 'place',
  ),
  Review(
    id: 'rev_004',
    authorName: 'Rohan Kapoor',
    authorAvatar: '',
    rating: 4.8,
    comment:
        'Staying at the Taj Mahal Palace Mumbai was a dream. The butler service, '
        'the harbour views, the history in every corner. '
        'Worth every rupee for a special occasion.',
    date: DateTime.now().subtract(const Duration(days: 21)),
    itemId: 'htl_001',
    itemType: 'hotel',
  ),
  Review(
    id: 'rev_005',
    authorName: 'Sneha Reddy',
    authorAvatar: '',
    rating: 4.6,
    comment:
        'Manali in December is a wonderland! The ski slopes were amazing and '
        'the hotel staff were super helpful. The Rohtang Pass road was '
        'tough but absolutely worth it.',
    date: DateTime.now().subtract(const Duration(days: 45)),
    itemId: 'pkg_003',
    itemType: 'package',
  ),
];

// ─── HELPER GETTERS ──────────────────────────────────────────────────────────

List<TravelPackage> get featuredPackages =>
    mockPackages.where((p) => p.isFeatured).toList();

List<TravelPackage> get popularPackages =>
    mockPackages.where((p) => p.isPopular).toList();

List<TravelPackage> packagesByCategory(String category) =>
    category == 'All'
        ? mockPackages
        : mockPackages.where((p) => p.category == category).toList();

List<Hotel> hotelsByCity(String city) =>
    city == 'All'
        ? mockHotels
        : mockHotels.where((h) => h.city == city).toList();

List<TouristPlace> placesByCategory(String category) =>
    category == 'All'
        ? mockPlaces
        : mockPlaces.where((p) => p.category == category).toList();

List<Review> reviewsFor(String itemId) =>
    mockReviews.where((r) => r.itemId == itemId).toList();
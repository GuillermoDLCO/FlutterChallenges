class Country {
  const Country({
    required this.name,
    required this.image,
    required this.reviewer,
    required this.reviewerPhoto,
    required this.reviewDetail,
    this.read = false,
  });
  final String name;
  final String image;
  final String reviewer;
  final String reviewerPhoto;
  final bool read;
  final ReviewDetail reviewDetail;

  Country copyWith({
    String? name,
    String? image,
    String? reviewer,
    String? reviewerPhoto,
    bool? read,
    ReviewDetail? turismDetail,
    bool? isSelected,
  }) {
    return Country(
      name: name ?? this.name,
      image: image ?? this.image,
      reviewer: reviewer ?? this.reviewer,
      reviewerPhoto: reviewerPhoto ?? this.reviewerPhoto,
      read: read ?? this.read,
      reviewDetail: turismDetail ?? reviewDetail,
    );
  }
}

class ReviewDetail {
  const ReviewDetail({
    required this.title,
    required this.description,
    required this.likes,
    required this.location,
    required this.views,
    required this.reviewSubtitle,
    required this.reviewContentSubtitle,
    required this.hotels,
  });
  final String title;
  final String description;
  final int likes;
  final String location;
  final int views;
  final String reviewSubtitle;
  final String reviewContentSubtitle;
  final List<Hotel> hotels;
}

class Hotel {
  const Hotel({
    required this.title,
    required this.price,
    required this.image,
  });
  final String title;
  final double price;
  final String image;
}

List<Country> countriesData = [
  const Country(
    name: 'Japon',
    image: 'assets/travel_app/card_left.png',
    reviewer: 'Leslie Alexander',
    reviewerPhoto: 'assets/travel_app/avatar.jpg',
    reviewDetail: ReviewDetail(
      title: 'Travel to Japon',
      description:
          'My trip to Japon started in Beijing, where I stayed in a beautiful '
          'hotel called...',
      likes: 2200,
      location: 'Japon',
      views: 1123,
      reviewSubtitle: 'At First',
      reviewContentSubtitle:
          "Let's figure out how much I spendt on this trip of money and time, "
          'and then the story begins',
      hotels: [
        Hotel(
          title: 'Crown 5',
          price: 12.99,
          image: 'assets/travel_app/crown_5.png',
        ),
        Hotel(
          title: 'Hotel Green',
          price: 12.99,
          image: 'assets/travel_app/west_asia.png',
        ),
        Hotel(
          title: 'Crown 5',
          price: 12.99,
          image: 'assets/travel_app/motel.png',
        ),
      ],
    ),
  ),
  const Country(
    name: 'Africa',
    image: 'assets/travel_app/card_central.png',
    reviewer: 'Leslie Alexander',
    reviewerPhoto: 'assets/travel_app/avatar.jpg',
    reviewDetail: ReviewDetail(
      title: 'Travel to Africa',
      description:
          'My trip to Africa started in Beijing, where I stayed in a beautiful '
          'hotel called...',
      likes: 2200,
      location: 'Africa',
      views: 1123,
      reviewSubtitle: 'At First',
      reviewContentSubtitle:
          "Let's figure out how much I spendt on this trip of money and time, "
          'and then the story begins',
      hotels: [
        Hotel(
          title: 'Crown 5',
          price: 12.99,
          image: 'assets/travel_app/crown_5.png',
        ),
        Hotel(
          title: 'Hotel Green',
          price: 12.99,
          image: 'assets/travel_app/west_asia.png',
        ),
        Hotel(
          title: 'Crown 5',
          price: 12.99,
          image: 'assets/travel_app/motel.png',
        ),
      ],
    ),
  ),
  const Country(
    name: 'Turkey',
    image: 'assets/travel_app/card_right.png',
    reviewer: 'Leslie Alexander',
    reviewerPhoto: 'assets/travel_app/avatar.jpg',
    reviewDetail: ReviewDetail(
      title: 'Travel to Turkey',
      description:
          'My trip to Africa started in Beijing, where I stayed in a beautiful '
          'hotel called...',
      likes: 2200,
      location: 'Turkey',
      views: 1123,
      reviewSubtitle: 'At First',
      reviewContentSubtitle:
          "Let's figure out how much I spendt on this trip of money and time, "
          'and then the story begins',
      hotels: [
        Hotel(
          title: 'Crown 2',
          price: 12.99,
          image: 'assets/travel_app/crown_5.png',
        ),
        Hotel(
          title: 'Hotel Green',
          price: 12.99,
          image: 'assets/travel_app/west_asia.png',
        ),
        Hotel(
          title: 'Motel',
          price: 12.99,
          image: 'assets/travel_app/motel.png',
        ),
      ],
    ),
  ),
  const Country(
    name: 'Italy',
    image: 'assets/travel_app/italy.png',
    reviewer: 'Leslie Alexander',
    reviewerPhoto: 'assets/travel_app/avatar.jpg',
    reviewDetail: ReviewDetail(
      title: 'Travel to Italy',
      description:
          'My trip to Italy started in Beijing, where I stayed in a beautiful '
          'hotel called...',
      likes: 2200,
      location: 'Italy',
      views: 1123,
      reviewSubtitle: 'At First',
      reviewContentSubtitle:
          "Let's figure out how much I spendt on this trip of money and time, "
          'and then the story begins',
      hotels: [
        Hotel(
          title: 'Crown 2',
          price: 12.99,
          image: 'assets/travel_app/crown_5.png',
        ),
        Hotel(
          title: 'Hotel Tusl',
          price: 12.99,
          image: 'assets/travel_app/west_asia.png',
        ),
        Hotel(
          title: 'Motel',
          price: 12.99,
          image: 'assets/travel_app/motel.png',
        ),
      ],
    ),
  ),
  const Country(
    name: 'West',
    image: 'assets/travel_app/west_asia.png',
    reviewer: 'Leslie Alexander',
    reviewerPhoto: 'assets/travel_app/avatar.jpg',
    reviewDetail: ReviewDetail(
      title: 'Travel to West Asia',
      description:
          'My trip to West Asia started in Beijing, where I stayed in a '
          'beautiful hotel called...',
      likes: 2200,
      location: 'West Asia',
      views: 1123,
      reviewSubtitle: 'At First',
      reviewContentSubtitle:
          "Let's figure out how much I spendt on this trip of money and time, "
          'and then the story begins',
      hotels: [
        Hotel(
          title: 'Crown 2',
          price: 12.99,
          image: 'assets/travel_app/crown_5.png',
        ),
        Hotel(
          title: 'Hotel Green',
          price: 12.99,
          image: 'assets/travel_app/west_asia.png',
        ),
        Hotel(
          title: 'Motel',
          price: 12.99,
          image: 'assets/travel_app/motel.png',
        ),
      ],
    ),
  ),
];

const categories = [
  'All',
  'Overview',
  'Hotels',
  'Food',
  'Memes',
  'Restaurants'
];

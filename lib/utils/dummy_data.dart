import 'package:movie_tickets_booking/model/seat_layout_model.dart';
import 'package:movie_tickets_booking/model/event_model.dart';
import 'package:movie_tickets_booking/model/movie_model.dart';
import '../model/theatre_model.dart';
import '../model/crew_cast_model.dart';
import '../model/offer_model.dart';
import '../utils/mytheme.dart';
import '../model/ad_slider_model.dart';
import '../model/menu_model.dart';
import '../utils/constants.dart';

List<AdSliderModel> sliderData = [
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Phim", asset: "assets/icons/film.svg"),
  MenuModel(name: "Sự kiện", asset: "assets/icons/spotlights.svg"),
  MenuModel(name: "Kịch", asset: "assets/icons/theater_masks.svg"),
  MenuModel(name: "Thể thao", asset: "assets/icons/running.svg"),
  MenuModel(name: "Hoạt động", asset: "assets/icons/flag.svg"),
  MenuModel(name: "Công trình", asset: "assets/icons/pyramid.svg"),
];



List<String> cities = [
  "Đà Nẵng",
  "TP Hồ Chí Minh",
  "Hà Nội",
  "Hải Phòng",
  "Đà Lạt",
];

List<MovieModel> movies = [
  MovieModel(
    title: "Black Panther \nThe King", 
    description: "Sự trở lại của Chiến binh Báo đen", 
    actors: ["Wasabi Mizuta", "Megumi Ohara", "Yumi Kakazu"], 
    like: 98, 
    bannerUrl: "assets/movies/black_panther.jpg",
  ),

  MovieModel(
    title: "Lật mặt 7: \nMột điều ước", 
    description: "Điều ước của Mẹ", 
    actors: ["Thanh Hiền", "Trương Minh Cường", "Đinh Y Nhung", "Quách Ngọc Tuyên", "Trâm Anh", "Trần Kim Hải"], 
    like: 91, 
    bannerUrl: "assets/movies/latmat7.png",
  ),

  MovieModel(
    title: "Fast & Furious 9: \nHuyền thoại tốc độ", 
    description: "Huyền thoại quay trở lại", 
    actors: ["Vin Diesel", "Charlize Theron", "John Cena"], 
    like: 90, 
    bannerUrl: "assets/movies/fast&furious.png",
  ),
  
  MovieModel(
    title: "Star Wars 8: \nJedi cuối cùng", 
    description: "Jedi cuối cùng xuất hiện", 
    actors: ["Daisy Ridley", "John Boyega", "Mark Hamill"], 
    like: 84, 
    bannerUrl: "assets/movies/star_wars.png",
  ),

    MovieModel(
    title: "Ám ảnh kinh hoàng\n", 
    description: "Câu chuyện chưa kể về ngôi nhà ma ám", 
    actors: ["Vera Farmiga", "Patrick Wilson", "Lili Taylo", "Ron Livingston"], 
    like: 84, 
    bannerUrl: "assets/movies/conjuring.png",
  ),
];

List<String> screens = [
  "3D",
  "2D",
];

List<EventModel> events = [
  EventModel(
    title: "Tết thiếu nhi",
    description: "Music show",
    date: "31/10/2024",
    bannerUrl: "assets/events/event1.png",
  ),
  EventModel(
    title: "Music DJ..",
    description: "Music show",
    date: "01/07/2024",
    bannerUrl: "assets/events/event2.png",
  ),
  EventModel(
    title: "Summer sounds..",
    description: "Comedy show",
    date: "01/06/2024",
    bannerUrl: "assets/events/event3.png",
  ),
  EventModel(
    title: "DIFF 2024",
    description: "Festival",
    bannerUrl: "assets/events/event4.png",
    date: "08/06/2024",
  ),

];

List<EventModel> plays = [
  EventModel(
    title: "Trái tim người Hà Nội",
    description: "Hành trình tìm lại quá khứ, tìm lại cuộc sống của Kiên - một người lính trở về từ cuộc chiến tranh tàn khốc",
    date: "03/08/2024",
    bannerUrl: "assets/plays/play1.png",
  ),
  EventModel(
    title: "Hai viên ngọc thần",
    description: "Bài học về cách đối nhân xử thế, trung thực trong cuộc sống",
    date: "04/08/2024",
    bannerUrl: "assets/plays/play2.png",
  ),
  EventModel(
    title: "Thúy Kiều - Một kiếp đoạn trường",
    description: "Khắc hoạ một bức tranh hoàn chỉnh nhất về cuộc đời hồng nhan bạc phận của nàng Thuý Kiều nhiều kiếp truân chuyên ...",
    date: "05/08/2024",
    bannerUrl: "assets/plays/play3.png",
  ),
  EventModel(
    title: "Mảnh đất lắm người nhiều ma",
    description: "Vì việc chia đất ruộng ở xã, các phe đấu đá nhau chí tử để tranh đất tốt mà mới xảy ra những chuyện mâu thuẫn ...",
    bannerUrl: "assets/plays/play4.png",
    date: "04/08/2024",
  ),
];
List<TheatreModel> theatres = [
  TheatreModel(id: "1", name: "CGV Vincom"),
  TheatreModel(id: "2", name: "Galaxy"),
  TheatreModel(id: "3", name: "Metiz"),
  TheatreModel(id: "4", name: "Starlight"),
];

List<String> facilityAsset = [
  "assets/icons/cancel.svg",
  "assets/icons/parking.svg",
  "assets/icons/cutlery.svg",
  "assets/icons/rocking_horse.svg",
];


final seatLayout = SeatLayoutModel(
    rows: 10,
    cols: 11,
    seatTypes: [
      {"title": "King", "price": 120.0, "status": "Filling Fast"},
      {"title": "Queen", "price": 100.0, "status": "Available"},
      {"title": "Jack", "price": 80.0, "status": "Available"},
    ],
    theatreId: 123,
    gap: 2,
    gapColIndex: 5,
    isLastFilled: true,
    rowBreaks: [5, 3, 2]);

List<CrewCastModel> crewCast = [
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Chadwick",
    image: "assets/actors/chadwick.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Letitia Wright",
    image: "assets/actors/LetitiaWright.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "B. Jordan",
    image: "assets/actors/b_jordan.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Lupita Nyong",
    image: "assets/actors/lupita_nyong.png",
  ),
];

List<OfferModel> offers = [
  OfferModel(
    title: "FREE NƯỚC",
    description: "Mua 1 Vé Tặng 1 Nước",
    expiry: DateTime(2024, 4, 15, 12),
    startTime: DateTime(2024, 3, 15, 12),
    discount: 100,
    color: MyTheme.redTextColor,
    gradientColor: MyTheme.redGiftGradientColors,
  ),
  OfferModel(
    title: "TÍCH ĐIỂM",
    description: "Đặt Vé để tích điểm",
    expiry: DateTime(2024, 4, 15, 12),
    startTime: DateTime(2024, 3, 15, 12),
    discount: 100,
    color: MyTheme.greenTextColor,
    gradientColor: MyTheme.greenGiftGradientColors,
    icon: "gift_green.svg",
  ),  
];

final List<int> s = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

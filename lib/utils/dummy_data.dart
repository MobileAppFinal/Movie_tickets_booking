import 'package:movie_tickets_booking/model/event_model.dart';
import 'package:movie_tickets_booking/model/movie_model.dart';

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
    title: "Doraemon - Bản giao hưởng địa cầu", 
    description: "1", 
    actors: ["Wasabi Mizuta", "Megumi Ohara", "Yumi Kakazu"], 
    like: 98, 
    bannerUrl: "assets/movies/doraemon.png",
  ),

  MovieModel(
    title: "Lật mặt 7: Một điều ước", 
    description: "2", 
    actors: ["Thanh Hiền", "Trương Minh Cường", "Đinh Y Nhung", "Quách Ngọc Tuyên", "Trâm Anh", "Trần Kim Hải"], 
    like: 91, 
    bannerUrl: "assets/movies/latmat7.png",
  ),

  MovieModel(
    title: "Fast & Furious 9: Huyền thoại tốc độ", 
    description: "3", 
    actors: ["Vin Diesel", "Charlize Theron", "John Cena"], 
    like: 90, 
    bannerUrl: "assets/movies/fast&furious.png",
  ),
  
  MovieModel(
    title: "Star Wars 8: Jedi cuối cùng", 
    description: "4", 
    actors: ["Daisy Ridley", "John Boyega", "Mark Hamill"], 
    like: 84, 
    bannerUrl: "assets/movies/star_wars.png",
  ),

    MovieModel(
    title: "Ám ảnh kinh hoàng", 
    description: "5", 
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
    title: "Happy Halloween",
    description: "Music show",
    date: "30/10/2024",
    bannerUrl: "assets/events/event1.png",
  ),
  EventModel(
    title: "Music DJ king monger Sert...",
    description: "Music show",
    date: "01/07/2024",
    bannerUrl: "assets/events/event2.png",
  ),
  EventModel(
    title: "Summer sounds festiva..",
    description: "Comedy show",
    date: "01/06/2024",
    bannerUrl: "assets/events/event3.png",
  ),
  EventModel(
    title: "DaNang International Firework Festival",
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
    title: "Con trai thì cút - Con gái thì giữ",
    description: "Phê phán và châm biếm nhiều vấn đề đang diễn ra trong cuộc sống hiện đại",
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

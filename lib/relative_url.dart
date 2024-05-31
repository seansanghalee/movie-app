enum RelativeUrl {
  popular(value: "popular"),
  nowPlaying(value: "now-playing"),
  comingSoon(value: "coming-soon");

  final String value;

  const RelativeUrl({
    required this.value,
  });
}

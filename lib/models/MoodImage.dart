class MoodImage {
  final String mood;
  final String image;

  MoodImage(this.mood, this.image);
}

List<MoodImage> moodImages = [
  MoodImage('Great', 'assets/emojis/png/025-laughing.png'),
  MoodImage('Good', 'assets/emojis/png/001-happy.png'),
  MoodImage('Neutral', 'assets/emojis/png/019-embarrassed.png'),
  MoodImage('Bad', 'assets/emojis/png/044-crying.png'),
  MoodImage('Awful', 'assets/emojis/png/049-mad.png'),
];

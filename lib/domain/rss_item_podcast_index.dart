import 'package:xml/xml.dart';

import '../util/helpers.dart';
import 'podcast_index/rss_podcast_index_chapters.dart';
import 'podcast_index/rss_podcast_index_license.dart';
import 'podcast_index/rss_podcast_index_person.dart';
import 'podcast_index/rss_podcast_index_season.dart';
import 'podcast_index/rss_podcast_index_soudbite.dart';
import 'podcast_index/rss_podcast_index_transcript.dart';
import 'podcast_index/rss_podcast_index_value.dart';

class RssItemPodcastIndex {
  final RssPodcastIndexChapters? chapters;
  final List<RssPodcastIndexTranscript?> transcripts;
  final List<RssPodcastIndexSoundbite?> soundbites;
  final List<RssPodcastIndexPerson?> persons;
  final List<RssPodcastIndexValue?> value;
  final RssPodcastIndexLicense? license;
  final RssPodcastIndexSeason? season;

  RssItemPodcastIndex({
    this.chapters,
    this.transcripts = const <RssPodcastIndexTranscript>[],
    this.soundbites = const <RssPodcastIndexSoundbite>[],
    this.persons = const <RssPodcastIndexPerson>[],
    this.value = const <RssPodcastIndexValue>[],
    this.license,
    this.season,
  });

  factory RssItemPodcastIndex.parse(XmlElement element) {
    return RssItemPodcastIndex(
      chapters: RssPodcastIndexChapters.parse(
        findElementOrNull(element, 'podcast:chapters'),
      ),
      transcripts: element.findElements('podcast:transcript').map((e) {
        return RssPodcastIndexTranscript.parse(e);
      }).toList(),
      soundbites: element.findElements('podcast:soundbite').map((e) {
        return RssPodcastIndexSoundbite.parse(e);
      }).toList(),
      persons: element.findElements('podcast:person').map((e) {
        return RssPodcastIndexPerson.parse(e);
      }).toList(),
      value: element.findElements('podcast:value').map((e) {
        return RssPodcastIndexValue.parse(e);
      }).toList(),
      license: RssPodcastIndexLicense.parse(
        findElementOrNull(element, 'podcast:license'),
      ),
      season: RssPodcastIndexSeason.parse(
        findElementOrNull(element, 'podcast:season'),
      ),
    );
  }
}

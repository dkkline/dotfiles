local g = import 'lib/base.libsonnet';

local rawMatches = [
  ### Dashes
  {
    triggers: [
      'emdash',
      'em',
      '--',
    ],
    replace: '—',
  },
  {
    triggers: [
      'endash',
      'en',
      '-',
    ],
    replace: '–',
  },

  ### Ellipsis
  {
    triggers: [
      'ellipsis',
      'ellip',
      '...',
      '3.',
    ],
    replace: '…',
  },

  ### Partitioners
  # Paragraphs
  {
    triggers: [
      'pilcrow',
      'paragraph',
      'paraph',
      'q',
    ],
    replace: '¶',
  },
  {
    triggers: [
      'rpilcrow',
      'rparagraph',
      'rparaph',
      'p',
    ],
    replace: '⁋',
  },

  # Section
  {
    triggers: [
      'section',
      'sect',
      's',
    ],
    replace: '§',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)

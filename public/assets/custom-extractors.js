const tagesschauExtractor = {
  domain: 'www.tagesschau.de',
  title: {
    selectors: ['.seitenkopf__headline--text'],
  },
  author: {
    selectors: ['.authorline__author'],
  },
  content: {
    selectors: ['article'],
    clean: [
      '[data-config]',
      '.seitenkopf__headline--text',
      '.authorline__author',
    ],
  },
  date_published: {
    selectors: ['p.metatextline'],
  },
};

Mercury.addExtractor(tagesschauExtractor)

// ~/.config/finicky/finicky.js
// [Config file details](https://github.com/johnste/finicky/wiki/Configuration-(v4))
export default {
  defaultBrowser: 'Google Chrome',
  // rewrite: [
  // ],
  handlers: [
    {
      match: [
        '*.digital.nhs.uk/*'
      ],
      browser: 'Google Chrome'
    },
    {
      match: [
        /github.com\/(?!NHSDigital).*/
      ],
      browser: 'Google Chrome Beta'
    },
    {
      match: [
        '*.splunkcloud.com/*',
        'github.com/NHSDigital/*'
      ],
      browser: 'Firefox'
    }
  ]
}

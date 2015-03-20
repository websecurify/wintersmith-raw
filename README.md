# wintersmith-raw

[Wintersmith](https://github.com/jnordberg/wintersmith) plugin for keeping files as-is, instead of creating html pages or doing other kinds of processing.

## Installing

Install globally or locally using npm

```
npm install [-g] wintersmith-raw
```

and add `wintersmith-raw` to your config.json

```json
{
  "plugins": [
    "wintersmith-raw"
  ]
}
```

or

```json
{
  "plugins": [
    "wintersmith-raw/plugin.coffee"
  ]
}
```

## Configuration

In your config files you must define your raw paths like this:

```json
{
  "raw": [
    "path/to/**/*.json"
  ]
}
```

You can use the standard globbing patters. All raw files will be part of your content tree so you can access them as usual. JSON files have metadata property as normal.

# Cadasta API Docs

The Cadasta API docs provide documentation for Cadasta's REST API. The API docs are using [Docbox](https://github.com/mapbox/docbox), a React app that compiles Markdown documents into an HTML website. 

## Contributing

If you'd like to contribute to this documentation, you'll need to edit Markdown files that live in [`content`](https://github.com/Cadasta/api-docs/tree/master/content). Each file here follows the [Docbox format](https://github.com/mapbox/docbox/blob/master/content/example.md), as developed by MapBox. 

_[Learn more about writing documentation using Docbox](https://github.com/mapbox/docbox#writing-documentation)_


## Installing and Compiling Docs Locally

To view what your changes will look like on the website, you need to compile the docs and run a local web server. Below are instructions for how to do this, modified from the [Docbox instructions](https://github.com/mapbox/docbox#development). 

After you `npm install` the project, you can run `npm start` and its development server, [budo](https://github.com/mattdesl/budo) will serve the website locally and update automatically.

## Requirements

* Node v4 or higher
* NPM
* Git

To run the site locally:

1. Clone this repository
	1. using SSH: `git clone git@github.com:Cadasta/api-docs.git`
	2. using HTTPS: `git clone https://github.com/Cadasta/api-docs.git`
2. `npm install`
3. `npm start`
4. Open http://localhost:9966/

To exit `npm start`, hit `ctrl + C`. 

_[Follow Docbox instructions](https://github.com/mapbox/docbox#development)_


## Deployment

We host API docs on [Github pages](https://pages.github.com/); the current live site is pushed to `gh-pages` branch. There is a shell script that simplifies deployment. 

The script:

1. Compiles the markdown files into an HTML website.
2. Clones the `gh-pages` branch into a new directory.
3. Copies the compiled HTML website into that directory.
4. Commits and pushes the contents to `gh-pages` (if there are changes).

To deploy API docs to `gh-pages` run:

```bash
./deploy.sh
```

**NOTE:** Using the shell script will only work if you have set up [SSH for Github](https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-ssh-urls) correctly. 

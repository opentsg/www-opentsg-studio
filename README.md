# www-opentsg-studio

Built with github.com/mrmxf/fohuw.

## Forking, cloning & editing

Once you've (cloned) the repo, you need to install [git],
[golang] v1.22+, [node] v18.17.0 and [hugo] v0.121.1+ in your development
environment. My preference was to use [gitpod] which runs VS Code in your
browser (on a phone on a train) as the dev environment to ensure I could update
the site from anywhere, anytime on any device 😃.

The Mr MXF website uses the [hugo] modules feature for the fohuw theme and the
svelte user interaction widgets.

### Step by step dev environment setup (e.g. for mac)

1. clone the site
   * `git clone https://github.com/opentsg/www-opentsg-studio.git`
2. install the [extended](https://gohugo.io/installation) version of Hugo
3. Install [Dart Sass](https://gohugo.io/hugo-pipes/transpile-sass-to-css/#dart-sass)
4. execute the following:
  *

```bash
# install node packages with yarn
hugo get
hugo server
```

[fohuw]:             https://github.com/mrmxf/fohuw
[Docsy]:             https://github.com/google/docsy
[fomantic ui]:       https://fomantic-ui.com/
[git]:               https://git-scm.com
[gitpod]:            https://www.gitpod.io/
[golang]:            https://go.dev/doc/install
[Hugo]:              https://gohugo.io/installation/
[Hugo theme module]: https://gohugo.io/hugo-modules/use-modules/#use-a-module-for-a-theme
[node]:              https://nodejs.org/en/download

## deploying

The github action script `/.github/workflows/hugo-container.yaml` creates a
docker container that can be viewed with:

```sh
# run the docker image for a proxy forwarder on port 10000
docker run -d -rm -p 10000:80 <DOCKER_NS>/www-opentsg-studio-arm:x.y.z

# check it's working
curl localhost:10000
```

## The videos and downloads don't show

Due to the massive size of some of the content referenced on the site the
NGINX front end is configured to dynamically mount the `/r` folder.

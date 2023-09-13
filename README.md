# metarex.media website

This website was originally based on [docsy] that is a [Hugo theme module]
for technical documentation sites, providing easy site navigation, structure,
and more. This implementation of [docsy] is being heavily altered to align with
the elegant [fomantic ui] framework.

The end result is a static website that can sit on an S3 bucket, USB stick or
similar and runs just fine without a database or high power server.

The website is public domain so that you can add issues if you find errors in
the content or want to go back in time and find out what we changed. Some
downloads are hosted only on the website as they are too big for GitHub.

## Forking, cloning & editing

Once you've (cloned or forked & cloned) the repo, you need to install both
[golang] and [hugo] in your development environment. My preference was to use
[gitpod] which runs VS Code in your browser (on a phone on a train) as the dev
environment to ensure I could update the site from anywhere, anytime on any
device 😃.

[Docsy]:             https://github.com/google/docsy
[fomantic ui]:       https://fomantic-ui.com/
[gitpod]:            https://www.gitpod.io/
[golang]:            https://go.dev/doc/install
[Hugo]:              https://gohugo.io/installation/
[Hugo theme module]: https://gohugo.io/hugo-modules/use-modules/#use-a-module-for-a-theme

## deploying

Build the docker file and push it to your favorite image registry. On the host
use this style of execution:
```sh
# pull the docker image

# run the docker image for a proxy forwarder on port 10000
docker run -d -p 10000:80 mrx-static

# check it's working
curl localhost:10000
```
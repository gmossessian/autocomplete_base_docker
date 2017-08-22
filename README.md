This is a repo for Base Autocomplete Docker Image. It's purpose is to optimize autocomplete's building speed.

If you want to update base image:

1) Commit your updates.

2) Go to [Releases List](https://github.com/Constructor-io/autocomplete_base_docker/releases) and find out which GIT Tag should be next.

3) Tag your update:

```
git tag -a v0.0.22 -m "Some important update"
```

4) Push new commits and tags to GitHub:

```
git push origin master
git push --tags
```

5) Go to your autocomplete repo, find "Dockerfile" and update section "FROM" using your new version. 
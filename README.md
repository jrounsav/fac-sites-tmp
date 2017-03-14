Test
# Faculty Websites

This codebase is an aggregate of several other repositories in order to provide a complete solution for consumption by Pantheon, and has been broken into two branches.

The master branch contains no submodules, in that the files necessary have been added ONLY in order to work properly with Pantheon.

The "complete" branch contains the submodule references for the purpose of local development. More on that below.

Submodules included
* ASU OS Fork - ASU/openscholar/
* ASU-specific OS customizations - ASU/asu-openscholar-custom
* ASU Contrib Modules - ASU/asu-drupal-modules

The top-level container code is the appropriate version of Pantheon's Drupal core for OpenScholar

## Workflow & Build Process
In order to speed up the release process and better manage the various contrib repos a build process has been put in place. 
The build will periodically grab the latest Faculty Website repo and check each of the submodules for newer tags.
If new tags are discovered in any of the repos it will update the submodule to point to that tag.

As such, it is necessary to tag a contributing repository once all of the commits making up a release have been pushed.

## Local Development
For local development a user will clone down the Faculty Websites repo, checkout the complete branch, initialize the submodules, and run the openscholar build script. After which they should switch the submodules to their relevant development branches and follow the regular branch=>develop=>test=>merge workflow

Once the commits that constitute a release are merged into the head of the contributing repo, a user should tag the latest commit so that it is picked up by the build process.

### Local Dev Initialization
Cloning complete repo: First Time Checking out repo
```
git clone git@github.com:ASU/faculty-websites.git
git checkout complete
git submodule update --init --recursive
```
These commands should pull down the repository and set all of the submodules to the currently utilized commits.

## In Lieu of Working Build
If the build process that generates  the faculty websites repo is down, the following steps can be taken to strip the submodules out of the codebase and leave the necessary files in the "master" branch.

ToDo: Put this into a build script.
```
Updating the "master" with the "complete" files
STARTING FROM PARENT DIR OF Faculty Websites 
       mkdir holder
	   ./faculty-websites/openscholar/scripts/build
       cp -r faculty-websites/openscholar/openscholar holder/
       cp -r faculty-websites/sites holder/
       cd holder/
       cd sites/
       rm .git
       rm .gitignore 
       rm .gitmodules 
       cd all/modules/
       cd asu-drupal-modules/
       rm .git
       rm .gitignore 
       cd ../../../
SHOULD BE AT PARENT OF Faculty Websites
       cd faculty-websites/
       git checkout master
       rm -rf sites/
       rm -rf openscholar/
       cp -r ../holder/sites .
       cp -r ../holder/openscholar profiles/
       git add .
       git commit -m "Some relevant commit message"
       git status
       git push origin master
```


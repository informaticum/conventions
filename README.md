# Informaticum :: Code Conventions/Developer Settings

Hi there,

if you want to support the informaticum projects, you should be aware of our code styles, conventions and formatter rules.

In order to ...

* keep the code consistent, 
* prevent encoding problems, 
* understand new code more quickly and thoroughly,
* avoid arguing over syntax, naming standards, and style preferences

... [we must insist on consistent code](https://www.google.de/search?q=coding+style+matters).

Avowedly, good code style is a subjective matter and the perception of beauty is in the eye of the beholder.
However, these are the rules which we think are fine for us:

## Testing

* We prefer [JUnit 5](https://junit.org/junit5/) over [JUnit 4](https://junit.org/junit4/)
* We prefer [AssertJ](https://assertj.github.io/doc/) over [Hamcrest](http://hamcrest.org/JavaHamcrest/)
* We differ between [unit tests](https://maven.apache.org/surefire/maven-surefire-plugin/index.html) and [integration tests](https://maven.apache.org/surefire/maven-failsafe-plugin/index.html)
* No test should be `@Ignore`d without a very good reason

## [Eclipse](https://www.eclipse.org/) ([September 2021](https://projects.eclipse.org/releases/2021-09))

* Window -> Preference -> General -> Editors -> Structured Text Editors -> Task Tags
    * Settings according to [Informaticum Task Tags](./eclipse/informaticum_general_editors_structured-text-editors_task-tags.md)
* Window -> Preference -> General -> Workspace
    * Settings according to [Informaticum Workspace Settings](./eclipse/informaticum_general_workspace.md)
* Window -> Preference -> Java -> Appearance -> Type Filters
    * Settings according to [Informaticum Type Filters](./eclipse/informaticum_java_appearance_type-filters.md)
* Window -> Preference -> Java -> Code Style -> Clean Up
    * Import the [Informaticum Clean-Up Profile](./eclipse/informaticum_java_code-style_clean-up.xml)
    * Note `informaticum_java_code-style_clean-up.md` is a human-readable copy of this XML file and allows comparison to `informaticum_java_editor_save-actions.md`
* Window -> Preference -> Java -> Code Style -> Formatter
    * Import the [Informaticum Code Formatter Profile](./eclipse/informaticum_java_code-style_formatter.xml)
* Window -> Preference -> Java -> Code Style -> Organize Imports
    * a) Settings according to [Informaticum Organize Imports](./eclipse/informaticum_java_code-style_organize_imports.md)
    * b) Import the [Informaticum Code Import Order](./eclipse/informaticum_java_code-style_organize_imports.importorder)
* Window -> Preference -> Java -> Compiler -> Task Tags
    * Settings according to [Informaticum Task Tags](./eclipse/informaticum_java_compiler_task-tags.md)
* Window -> Preference -> Java -> Editor -> Save Actions
    * Settings according to [Informaticum Save Actions](./eclipse/informaticum_java_editor_save-actions.md)
* Window -> Preference -> XML -> XML Files -> Editor
    * Settings according to [Informaticum XML Files](./eclipse/informaticum_xml_xml-files_editor.md)

## [Maven](https://maven.apache.org/)

Preliminarily, Maven runs much smarter with [Maven Bash Auto Completion](https://github.com/juven/maven-bash-completion).

Further, we (most of the time) respect the
[Maven's convention over configuration concept](http://books.sonatype.com/mvnref-book/reference/installation-sect-conventionConfiguration.html).
In particular, we use the
[Standard Directory Layout](http://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html).

### POM Conventions

As long as there are no good counter-arguments, all projects/project POM files should:

* follow the [POM Code Conventions of the Maven team](https://maven.apache.org/developers/conventions/code.html#pom-code-convention)
    * in addition, a project's build might fail [if the POM file is not formatted accordingly](https://www.mojohaus.org/tidy-maven-plugin/usage.html)
* Use UTF-8 [for all encodings](https://maven.apache.org/general.html#encoding-warning) (i.e., [compiler encoding](https://maven.apache.org/plugins/maven-compiler-plugin/compile-mojo.html#encoding), [resources encoding](https://maven.apache.org/plugins/maven-resources-plugin/resources-mojo.html#encoding), [`site` input encoding](https://maven.apache.org/plugins/maven-site-plugin/site-mojo.html#inputEncoding), [`site` output encoding](https://maven.apache.org/plugins/maven-site-plugin/site-mojo.html#outputEncoding)
* [fail if there are `clean` errors](https://maven.apache.org/plugins/maven-clean-plugin/clean-mojo.html#failOnError)
* [inspect the project dependencies](http://maven.apache.org/plugins/maven-dependency-plugin/analyze-only-mojo.html) and [fail if there is any warning](http://maven.apache.org/plugins/maven-dependency-plugin/analyze-only-mojo.html#failOnWarning)
* [`install` all projects at the end](https://maven.apache.org/plugins/maven-install-plugin/install-mojo.html#installAtEnd) (in case of a multimodule build)
* [`deploy` all projects at the end](https://maven.apache.org/plugins/maven-deploy-plugin/deploy-mojo.html#deployAtEnd) (in case of a multimodule build)
* also build [the sources-jar](https://maven.apache.org/plugins/maven-source-plugin/usage.html) and [the javadoc-jar](https://maven.apache.org/plugins/maven-javadoc-plugin/usage.html)
    * if there are code examples, the JavaDoc pages should support [syntax highlighting](https://github.com/informaticum/syntaxhighlighter-build)
    * consider [source:jar-no-fork](https://maven.apache.org/plugins/maven-source-plugin/jar-no-fork-mojo.html) and [javadoc:javadoc-no-fork](https://maven.apache.org/plugins/maven-javadoc-plugin/javadoc-no-fork-mojo.html)/[javadoc:aggregate-no-fork](https://maven.apache.org/plugins/maven-javadoc-plugin/aggregate-no-fork-mojo.html) to prevent multi-executions of `generate-sources`
* enforce [a certain Maven version](https://maven.apache.org/enforcer/enforcer-rules/requireMavenVersion.html), [a certain Java JDK version](https://maven.apache.org/enforcer/enforcer-rules/requireJavaVersion.html), and [that all plugins have a version defined](https://maven.apache.org/enforcer/enforcer-rules/requirePluginVersions.html)
* [`install`/`deploy` a flattened version of the POM file](https://www.mojohaus.org/flatten-maven-plugin/usage.html) instead of the original POM file
    * [note the available flatten modes](https://www.mojohaus.org/flatten-maven-plugin/flatten-mojo.html#flattenMode)
* build without any Maven WARNING (yep, we often fail but try our best)

#### Version Update Checks

In addition to the aforementioned POM conventions, we do ignore certain versions when checking for version updates.
Thus, we use a specific version rule set within the projects' POM files.

This rule set ([`versions-maven-plugin.rules.xml`](src/main/resources/de/informaticum/conventions/maven/versions-maven-plugin.rules.xml) or [`versions-maven-plugin.rules-with-milestones.xml`](src/main/resources/de/informaticum/conventions/maven/versions-maven-plugin.rules-with-milestones.xml)) can be obtained either by its GitHub URL ...

    <plugin>
      <groupId>org.codehaus.mojo</groupId>
      <artifactId>versions-maven-plugin</artifactId>
      <configuration>
        <rulesUri>https://raw.githubusercontent.com/informaticum/conventions/main/src/main/resources/de/informaticum/conventions/maven/versions-maven-plugin.rules.xml</rulesUri>
      </configuration>
    </plugin>

... or as a classpath resource¹ (*when adding the according dependency within the versions-maven-plugin*)

    <plugin>
      <groupId>org.codehaus.mojo</groupId>
      <artifactId>versions-maven-plugin</artifactId>
      <configuration>
        <rulesUri>classpath:///de/informaticum/conventions/maven/versions-maven-plugin.rules.xml</rulesUri>
      </configuration>
      <dependencies>
        <dependency>
          <groupId>de.informaticum</groupId>
          <artifactId>conventions</artifactId>
          <version>1</version>
        </dependency>
      </dependencies>
    </plugin>

- - -

¹
_Currently, the `de.informaticum:conventions` project is not deployed to Maven Central. Thus for now, you have to `install` this project locally (or just refer to the GitHub URI)._

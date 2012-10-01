# Sonar

- get sonar Ant task
- define the ant task

	<taskdef uri="antlib:org.sonar.ant" resource="org/sonar/ant/antlib.xml">
		<classpath path="path/to/lib" />
	</taskdef>

	<property key="sonar.jdbc.url" value="jdbc:mysql://localhost:3306/sonar?useUnicode=true&amp;characterEncoding=utf8" />
	<property key="sonar.jdbc.driverClassName" value="com.mysql.jdbc.Driver" />
	<property key="sonar.jdbc.username" value="sonar" />
	<property key="sonar.jdbc.password" value="sonar" />
	<property key="sonar.host.url" value="http://myserver:1234" />

- create target for sonar
  
  <target name="sonar">
    <property key="sonar.sources" value="list of source directories separated by a comma" />

    <!-- list of optional Sonar properties -->
    <property key="sonar.projectName" value="this value overrides the name defined in Ant root node" />
    <property key="sonar.binaries" value="list of directories which contain for example the Java bytecode" />
    <property key="sonar.tests" value="list of test source directories separated by a comma" />
    <property key="sonar.libraries" value="list of paths to libraries separated by a comma (These libraries are for example used by the Sonar Findbugs plugin)" />

    <sonar:sonar key="org.example:example" version="0.1-SNAPSHOT" xmlns:sonar="antlib:org.sonar.ant"/>
  </target>
</project>

ant sonar

<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	URM Usability Reporting Manager
	Copyright (C) 2012 internettechnik 
	Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.

	
	File: usabml-to-html5.xsl
	Date: 2011-01-14
	Author: jf
	
	Generates html for given xml data files in format UsabML.
	Tested with "Safari 5.x" only.
	
-->
<xsl:stylesheet version="2.0" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>
	
     
	<!-- The UsabML Stylesheet for HTML5 creation 
		(for *.xml exported usability test result reports) -->
	<xsl:template match="/">
		<html>
			<head>
				<link href="../stylesheets/usabml-to-html5.css" rel="stylesheet" type="text/css"/>
				<title>
					<xsl:value-of select="project/title"/>: <xsl:value-of select="project/report/title"/>
				</title>
			</head>
			<body>
				<small>Project <xsl:value-of select="project/title"/> (Report generated: "2011-01-02")</small>

				<xsl:apply-templates select="project/report" />

				<hr/>
				<small>2010, by jf</small>
			</body>
		</html>
	</xsl:template>
	
	<!-- *********************************************-->
	<!-- *************** Author(s) *******************-->
	<!-- *************** Short Description ***********-->
	<!-- *************** Table of Contents ***********-->
	<!-- ***************  Executive Summary **********-->
	<!-- ***************  Intro **********************-->
	<!-- ***************  Test ***********************-->
	<!-- ***************  Analysis *******************-->
	<!-- ***************  Appendix *******************-->
	<!-- *********************************************-->
	
	<xsl:template match="project/report">
		<a name="#{title}">
		<h1 class="title">
			<xsl:value-of select="./title"/>
		</h1></a>
		
		<table class="author">
			<tr><td class="author">by</td></tr>
			<tr><td class="author"> </td></tr>
			<xsl:for-each select="author">
				<xsl:sort select="./name" order="ascending"/>
				<tr>
					<td class="author"><xsl:value-of select="./name" /></td>
				</tr>	
			</xsl:for-each>
		</table>
		<xsl:value-of select="description" disable-output-escaping="yes"/>
		<h2>Contents</h2>
		<ul>
			<xsl:if test="attribute::testtype = 'he'">
				<li><a href="#executivesummary"		>1 Executive Summary</a></li>
				<li><a href="#introduction"			>2 Introduction</a>
					<ul>
					<li><a href="#methodology"		>2.1 Methodology</a></li>
					<li><a href="#he-experts"		>2.2 Evaluators</a></li>
					<li><a href="#user-profiles"	>2.3 User Profiles</a></li>
					</ul></li>
				<li><a href="#environment"			>3 Evaluation Environment</a></li>
				<li><a href="#positivefindings"		>4 Positive Findings</a>
					<ul>
						<li><a href="#positive-sel"	>4.1 Selected Positive Findings</a></li>
						<li><a href="#positive-all"	>4.2 All Positive Findings</a></li>
					</ul></li>
				<li><a href="#negativefindings"		>5 Suggestions (Negative Findings)</a>
					<ul>
					<li><a href="#negative-sel"		>5.1 List of Recommendations</a></li>
					<li><a href="#negative-all"		>5.2 All Negative Findings</a></li>
					</ul></li>
				<li><a href="#discussion"			>6 Discussion</a></li>
				<li><a href="#appendix"				>Appendix</a></li>
			</xsl:if>
			<xsl:if test="attribute::testtype = 'ta'">
				<li><a href="#executivesummary"		>1 Executive Summary</a></li>
				<li><a href="#introduction"			>2 Introduction</a>
					<ul>
						<li><a href="#methodology"	>2.1 Methodology</a></li>
						<li><a href="#test-users"	>2.2 Test Users</a></li>
						<li><a href="#environment"	>2.4 Test Environment</a></li>
						<li><a href="#training"		>2.5 Training</a></li>
					</ul></li>
				
				<li><a href="#results"				>3 Results</a>
					<ul>
						<!--li><a href="#issues"		>4.1 All Issues</a></li-->
						<li><a href="#taskresults"	>3.1 Task Completion</a></li>
						<li><a href="#res-feedback"	>3.2 Feedback Questionnaire</a></li>
						<li><a href="#interviews"	>3.3 Interviews</a></li>
						<li><a href="#transcripts"	>3.4 Test Transcripts</a></li>
					</ul></li>
				<li><a href="#analysis"				>4 Discussion</a>
					<ul>
						<li><a href="#findings-pos"		>4.1 Positive Findings</a></li>
						<li><a href="#findings-neg"		>4.2 Recommendations</a></li>
					</ul></li>
				<li><a href="#appendix"				>Appendix</a></li>
			</xsl:if>
		</ul>

		<a name="executivesummary" />
			<h2>1 Executive Summary</h2>
			<!--About half a page description of the tests and evaluation results:-->
			<small>
				<i>
					<xsl:value-of select="./summary" disable-output-escaping="yes"/>
				</i>
			</small>

		

		<!-- *********************************************-->
		<!-- *************** Test (he-heuristics) ********-->
		<!-- *************** Test (he-evaluators) ********-->
		<!-- *************** Test (ta-testusers) *********-->
		<!-- *************** Test (ta-tasks) *************-->
		<!-- *************** Test (environment/settings) *-->
		<!-- *************** Test (he-issues) ************-->
		<!-- *************** Test (ta-questionnaires) *****-->
		<!-- *********************************************-->
		
		<!-- *************** HE: sections for heuristic evaluation ********-->
		<xsl:if test="attribute::testtype = 'he'">
			<a name="introduction" />
				<h2>2 Introduction</h2>
				<p><xsl:value-of select="./introduction" disable-output-escaping="yes"/> </p>
			<a name="methodology" />
				<h3>2.1 Methodology</h3>
				<xsl:value-of select="./methodology" disable-output-escaping="yes" />
				<xsl:call-template name="heuristictable"/>
			<a name="he-experts" />
				<h3>2.2 Evaluators</h3>
				<xsl:call-template name="experts"/>
			<a name="user-profiles" />
				<h3>2.3 User Profiles</h3>
				<xsl:value-of select="./userprofiles/description" disable-output-escaping="yes" />
				<xsl:call-template name="userprofilelist"/>
			<a name="extentofeval" />
				<h3>2.4 Extent of Evaluation</h3>
				<xsl:value-of select=".//extentofevaluation" disable-output-escaping="yes" />
			<a name="environment" />
				<h2>3 Evaluation Environment</h2>			
			<xsl:apply-templates select="./environment" mode="he"/>
			<a name="positivefindings" />
				<h2>4 Positive Findings</h2>
				<xsl:call-template name="selectedpositivefindings" />
				<xsl:call-template name="postiveheuristicissuelist" />
			<a name="negativefindings" />
				<h2>5 Suggestions (Negative Findings)</h2>
				<xsl:call-template name="selectednegativefindings" />
				<xsl:call-template name="negativeheuristicissuelist" />
			<a name="discussion" />
				<h2>6 Discussion</h2>
				<xsl:value-of select=".//analysis/description" disable-output-escaping="yes" />
		</xsl:if>
		
		<!-- *************** TA: sections for thinking aloud ********-->
		<xsl:if test="attribute::testtype = 'ta'">
			<a name="introduction" />
				<h2>2 Methodology</h2>
				<p><xsl:value-of select="./introduction" disable-output-escaping="yes"/> </p>
			<a name="methodology" />
				<h3>2.1 Test Procedure</h3>
				<xsl:value-of select="./methodology" disable-output-escaping="yes" />
			<a name="test-users" />
				<h3>2.2 Test users</h3>
				<xsl:call-template name="testusers"/>
			<a name="tasks" />
				<h3>2.3 Tasks</h3>
				<xsl:value-of select="./tasks/description" disable-output-escaping="yes" />
				<xsl:call-template name="internaltasklist"/>
				<xsl:call-template name="tasklist"/>
			<a name="environment" />
				<h3>2.4 Test Environment</h3>	
				<xsl:apply-templates select="./environment" mode="ta"/>
			<a name="training" />
				<h3>2.5 Training</h3>			
				<xsl:apply-templates select="training"/>
		
			<a name="results" />
				<h2>3 Results</h2>
				<xsl:call-template name="taskresults"/>
				<xsl:call-template name="questionniareresults"/>
				<xsl:call-template name="interviews"/>
				<xsl:call-template name="transcripts"/>
			<a name="analysis" />
				<h2>4 Discussion</h2>
				<xsl:apply-templates select="./analysis"/>
		</xsl:if>
		
		<!-- *************** FE: sections for formal experiment ********-->
		<xsl:if test="attribute::testtype = 'fe'">
			<!-- TODO -->
			<a name="introduction-U" />
			<h3>2b Test users</h3>
			<xsl:call-template name="testusers"/>
			<h3>2c Tasks</h3>
			<xsl:value-of select="./tasks/description" disable-output-escaping="yes" />
			<xsl:call-template name="internaltasklist"/>
			<xsl:call-template name="tasklist"/>
			<a name="environment" />
			<h2>3 Environment</h2>
			<xsl:apply-templates select="./environment"/>
			<a name="results" />
			<h2>4 Results</h2>
			<xsl:call-template name="taskresults"/>
			<xsl:call-template name="questionniareresults"/>
			<a name="analysis" />
			<h2>5 Analysis</h2>
			<xsl:apply-templates select="./analysis"/>
		</xsl:if>
		
		
		<xsl:if test="count(//appendix)">
			<a name="appendix" />
			<h2>Appendix</h2>
			<xsl:call-template name="appendix"/>
		</xsl:if>
	</xsl:template>

	<!-- *********************************************-->
	<!-- *********************************************-->
	<!-- *********************************************-->
	


	<!-- *************** Test (he-heuristics) ********-->
	<xsl:template name="heuristictable">
		<table id="table1">
			
			<caption>
				<span class="label">Table 1:</span> Usability Heuristics. </caption>
			
			<thead>
				<tr>
					<th>No.</th>
					<th>Heuristics</th>
				</tr>
			</thead>
			
			<tbody>
				<xsl:apply-templates select="./heuristic"/>
			</tbody>
			
		</table>
	</xsl:template>
	
	<xsl:template match="heuristic">
		<tr>
			<th>
				<xsl:apply-templates select="attribute::id"/>
			</th>
			<td><xsl:apply-templates select="./description"/> (<xsl:apply-templates select="./title"
			/>)</td>
		</tr>
	</xsl:template>
	
	<!-- *************** Test (he-experts) ***********-->
	<xsl:template name="experts">
		
		<xsl:value-of select="./persons/description" disable-output-escaping="yes" />
		<a name="table2" />
		<table id="table2">
			
			<caption>
				<span class="label">Table 2:</span> Evaluators. </caption>
			
			<thead>
				<tr>
					<th>Alias</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Date/Time</th>
				</tr>
			</thead>
			
			<tbody>
				<xsl:for-each select="persons/person">
					<xsl:sort select="attribute::id"/>
					<tr>
						<th>
							<!--xsl:apply-templates select="@id"/-->
							<xsl:variable name="pid" select="@id" />
							<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>
						</th>
						<td>
							<xsl:apply-templates select="./name"/>
						</td>
						<td>
							<xsl:apply-templates select="./gender"/>
						</td>
						<td>
							<xsl:apply-templates select="./age"/>
						</td>
						<td>
							<xsl:call-template name="FormatDate">
								<xsl:with-param name="DateTime" select="./timestamp"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
			
		</table>
	</xsl:template>

	<!-- *************** Test (he-userprofiles *******-->
	<!--                      for experts; optional)  -->
	<xsl:template name="userprofilelist">
		<a name="table3"/>
		<table id="table3">
			
			<caption>
				<span class="label">Table 3:</span> User profiles.</caption>
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
				</tr>
			</thead>
			
			<tbody>
				<xsl:apply-templates select="./userprofiles/userprofile"/>
			</tbody>
			
		</table>
	</xsl:template>	
	<xsl:template match="userprofile" >
		<tr>
			<td>
				<xsl:apply-templates select="./title"/>
			</td>
			<td>
				<xsl:apply-templates select="./description"/>
			</td>
		</tr>
	</xsl:template>
	

	<!-- *************** Test (ta-testusers) *********-->
	<xsl:template name="testusers">
		<xsl:value-of select="./persons/description" disable-output-escaping="yes" />
		<xsl:variable name="cols" select="count(persons/person)+1" />
		<a name="table1"></a>
		<table id="table1">
			
			<caption>
				<span class="label">Table 1: </span> Test Users. </caption>
			
			<thead>
				<tr><th>Test User</th>
					<xsl:for-each select="./persons/person">
						<th>
							<!--xsl:apply-templates select="@id"/-->
							<!--xsl:apply-templates select="@id"/-->
							<xsl:variable name="pid" select="@id" />
							<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>
						</th>
					</xsl:for-each>
				</tr>
			</thead>
			<tbody>
				<tr><td>Date of Test</td>
				<xsl:for-each select="./persons/person">
					<td><xsl:call-template name="FormatDate">
						<xsl:with-param name="DateTime" select="./timestamp"/>
					</xsl:call-template></td>
				</xsl:for-each>
				</tr>
				<tr><td>Time of Test</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:call-template name="FormatDate">
							<xsl:with-param name="DateTime" select="./timestamp"/>
						</xsl:call-template></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Name</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./name"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Alias</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./alias"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Gender</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./gender"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Age</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./age"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Education</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./education"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Occupation</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./occupation"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<td colspan="{$cols}">IT Experience</td>
				</tr>
				<tr>
					<td>Level</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/level"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>PC-Usage (years)</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/pcusageinyears"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>PC-Usage (h/week)</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/pcusageperweek"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Operating System</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/mainoperatingsystem"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Web Usage (h/week)</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/webusageperweek"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Internet Connection</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/internetconnection"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Browser</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/mainwebbrowser"/>
						</td>
					</xsl:for-each>
				</tr>
				
				<tr>
					<td>Description</td>
					<xsl:for-each select="./persons/person">
						<td>
							<xsl:apply-templates select="./itexperience/description"/>
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<td>Usability Test Experience</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./hasusabtestexperience"/></td>
					</xsl:for-each>
				</tr>
				
				<!-- Add here some optional custom attributes for each user! -->
				<tr>
					<td colspan="{$cols}">Specific Questions</td>
				</tr>
				<xsl:for-each select="./persons/personattributes/personattribute">
					<xsl:sort select="@order" data-type="number" />
					<xsl:variable name="currentattribute"><xsl:value-of select="@id" /></xsl:variable><!--attr1 -->
					<tr>
						<td><xsl:value-of select="attribute" /></td>
					
					<xsl:for-each select="//project/report/persons/person">
						<td>
							<!--in row with attribute-id "attr1" show test-user special attribute: -->
							<xsl:value-of select="customattributes/customattribute[@personattributeid=$currentattribute]"/>
						</td>
					</xsl:for-each>
					</tr>
				</xsl:for-each>


				<tr>
					<td>Annotations</td>
					<xsl:for-each select="./persons/person">
						<td><xsl:apply-templates select="./annotations"/></td>
					</xsl:for-each>
				</tr>
			</tbody>
			
		</table>
	
	</xsl:template>
	<xsl:template match="person">
		<tr>
			<th>
				<xsl:apply-templates select="attribute::id"/>
			</th>
			<td>
				<xsl:apply-templates select="./name"/>
			</td>
			<td>
				<xsl:apply-templates select="./gender"/>
			</td>
			<td>
				<xsl:apply-templates select="./age"/>
			</td>
			<td>
				<xsl:apply-templates select="./education"/>
				<xsl:if test="./occupation">
				 (<xsl:apply-templates select="./occupation" />)
				</xsl:if>
			</td>
			<td><xsl:apply-templates select="./itexperience/level"/>
				<xsl:if test="./itexperience/description">			
				(<xsl:apply-templates select="./itexperience/description"/>)
				</xsl:if>
			</td>
			<td>
				<xsl:apply-templates select="./hasusabtestexperience"/>
			</td>
			<td>
				<xsl:apply-templates select="./annotations"/>
			</td>
			<td>
				<xsl:call-template name="FormatDate">
					<xsl:with-param name="DateTime" select="./timestamp"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="persons/testUser">
		<li>User</li>
		<table class="user">
			<tr>
				<th>Age</th>
				<th>Gender</th>
				<th>Education</th>
				<th>Experience</th>
				<th>Online(h)</th>
			</tr>
			<tr>
				<td>
					<xsl:apply-templates select="./age"/>
				</td>
				<td>
					<xsl:apply-templates select="./gender"/>
				</td>
				<td>...</td>
				<td>...</td>
				<td>...</td>
			</tr>
		</table>
	</xsl:template>
	
	
	<!-- *************** Test (ta/fe-tasks) **********-->
	<xsl:template name="internaltasklist">
		<a name="table2" />
		<table id="table2">
			
			<caption>
				<span class="label">Table 2:</span> Internal Task List.</caption>
			
			<thead>
				<tr>
					<!--th>No.</th-->
					<th>Title</th>
					<th>Description</th>
					<th>Prerequisite</th>
					<th>Ending criteria</th>
					<th>Duration (max)</th>
					<th>Possible Solution Path</th>
				</tr>
			</thead>
			
			<tbody>
				<xsl:apply-templates select="./tasks/task" mode="full"/>
			</tbody>
			
		</table>
	</xsl:template>
	<xsl:template match="task" mode="full">
		<tr>
			<!--td>
				<xsl:apply-templates select="attribute::id"/>
			</td-->
			<td>
				<xsl:apply-templates select="./title"/>
			</td>
			<td>
				<xsl:apply-templates select="./description"/>
			</td>
			<td>
				<xsl:apply-templates select="./prerequisite"/>
			</td>
			<td>
				<xsl:apply-templates select="./endingcriteria"/>
			</td>
			<td>
				<xsl:apply-templates select="./durationscheduled"/>
			</td>
			<td>
				<xsl:apply-templates select="./possiblesolutionpath"/>
			</td>
		</tr>
	</xsl:template>	
	<xsl:template name="tasklist">
		<a name="table3" />
		<table id="table3">
			
			<caption>
				<span class="label">Table 3:</span> Task list given to the users.</caption>
			
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
				</tr>
			</thead>
			
			<tbody>
				<xsl:apply-templates select="./tasks/task" mode="simple"/>
			</tbody>
			
		</table>
	</xsl:template>	
	<xsl:template match="task" mode="simple">
		<tr>
			<!--td>
				<xsl:apply-templates select="attribute::id"/>
			</td-->
			<td>
				<xsl:apply-templates select="./title"/>
			</td>
			<td>
				<xsl:apply-templates select="./description"/>
			</td>
		</tr>
	</xsl:template>
	
	<!-- *************** Test (ta-training) *-->
	<xsl:template match="training" >
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
	
	<!-- *************** Test (he test environment / ta evaluation envorinment) *-->
	<!-- *************** Test (he test environment / ta evaluation envorinment) *-->

	<!-- *************** environement mode=he *************************-->
	<xsl:template match="environment" mode="he">
		<xsl:value-of select="./description" disable-output-escaping="yes"/>
		<a name="table4" />
		<table id="table4">
			<caption>
				<span class="label">Table 4:</span> Evaluation environment used by each evaluator.</caption>
			<thead>
				<tr>
					<th>Evaluator</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="setting/device">
					<xsl:sort select="attribute::devicetype"/>
					<tr>
						<td>
							
							<xsl:if test="@personid">
								<xsl:variable name="pid" select="@personid" />
								<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/> </xsl:if>
						</td>
						<td>
							<xsl:apply-templates select="./description"/>
						</td>
						
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		
	</xsl:template>
	<!-- *************** environement mode=ta *************************-->
	<xsl:template match="environment" mode="ta">
		<xsl:value-of select="./description" disable-output-escaping="yes"/>
		<a name="table4" />
		<table id="table4">
			<caption>
				<span class="label">Table 4:</span> Test Environment.</caption>
			<thead>
				<tr>
					<th>Device</th>
					<th>Details</th>
					<th>Documents</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="device">
					<xsl:sort select="attribute::devicetype"/>
					<tr>
						<td>
							<xsl:apply-templates select="./title"/>
							<xsl:if test="@personid">
								<br/> of <!--xsl:value-of select="@personid"/--><xsl:variable name="pid" select="@personid" />
								<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/> </xsl:if>
						</td>
						<td>
							<xsl:apply-templates select="./description"/>
						</td>
						<td>
							<xsl:for-each select="./document">
								<xsl:if test="@type = 'image'">
									<img src="{filename}" alt="{description}" width="200"/>
									<br/>
									<a href="{filename}">
										<xsl:value-of select="description"/>
									</a>
								</xsl:if>
								<xsl:if test="@type = 'link'">
									<a href="{uri}">
										<xsl:value-of select="description"/>
									</a>
								</xsl:if>
								<br />
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		
	</xsl:template>


	<!-- *************** Test (ta-taskresults) *******-->
	<xsl:template name="taskresults">
		<a name="taskresults" />
		<h3>3.1 Task Completion</h3>
		Details of all performed tasks by the test users. This includes
			the actual time/duration and completion status.
		<a name="table5" />
		<table id="table5">
			<caption>
				<span class="label">Table 5:</span> Completion status of the tasks.</caption>
			<thead>
				<tr>
					<th>Task-No.</th>
					<th>Person</th>
					<th>Duration</th>
					<th>Completion:<br /> (with assistence)</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="taskresult" >
					<xsl:sort select="@taskid" order="ascending" />
					<xsl:sort select="@personid" order="ascending" />
					<tr>
						<th>
							<xsl:variable name="tid" select="@taskid" />
							<xsl:apply-templates select="//report/tasks/task[@id=$tid]/title"/>
						</th>
						<td>
							<xsl:variable name="pid" select="@personid" />
							<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias" />
						</td>
						<td>
							<xsl:apply-templates select="./durationactual"/>
						</td>
						<td>
							<xsl:apply-templates select="./completion"/>%
							<xsl:if test="withassistance">
								 (<xsl:value-of select="./withassistance"/>)								
							</xsl:if>
						</td>
					</tr>
					
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>



	<!-- *************** HE Selected Positive Findings ****-->
	<xsl:template name="selectedpositivefindings" >	
		<xsl:if test="count(analysis/finding[@findingtype = 'positive'])">
			<a name="positive-sel" />
			<h3>4.1 Selected Positive Findings</h3>
			
			<ul>
			
			<xsl:for-each select="analysis/finding">
				<xsl:sort select="@priority" order="ascending"/>
				<xsl:if test="@findingtype = 'positive'">
					<xsl:call-template name="onefinding"/>
				</xsl:if>
			</xsl:for-each>
			</ul>
			
		</xsl:if>
	</xsl:template>
	
	<!-- *************** Test (he-positive findings) *******-->
	<xsl:template name="postiveheuristicissuelist" >
		<a name="positive-all" />
		<h3>4.2 List of all Positive Findings</h3>
		<a name="table5" />
		<table id="table5">
			<caption>
				<span class="label">Table 5:</span> All Positive Findings.</caption>
			<thead>
				<tr>
					<th>Description</th>
					<th>Details</th>
					<th>Heuristic</th>
					<th>Issue found (person)</th>
					<th>Documents</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="heuristicissues/heuristicissue[direction='up']">
					<xsl:sort select="@id" order="ascending"/>
					<xsl:variable name="hid" select="./@heuristicid" />
					<tr>
						<th>
							<xsl:apply-templates select="./description"/>
						</th>
						<td>
							<xsl:apply-templates select="./notice"/>
						</td>
						<td>
							<xsl:value-of select="@heuristicid"/>:
							<xsl:apply-templates select="//report/heuristic[@id=$hid]/title"/>
						</td>
						<td>
							<xsl:apply-templates select="./found"/>
						</td>
						<td>
							<xsl:for-each select="./document">
								<img src="{filename}" alt="{description}" width="200"/>
								<br/>
								<a href="{filename}">
									<xsl:value-of select="description"/>
								</a>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		
	</xsl:template>
	
	<!-- *************** HE Selected Negative Findings ****-->
	<xsl:template name="selectednegativefindings" >
		<xsl:if test="count(analysis/finding[@findingtype = 'recommendation'])">
			<a name="negative-sel" />
			<h3>5.1 Analysis of the Main Problems (Negative Findings)</h3>
			
			<ul>
			<xsl:for-each select="analysis/finding">
				<xsl:sort select="@priority" order="ascending"/>
				<xsl:if test="@findingtype = 'recommendation'">
					<li><h4><xsl:value-of select="./title"/></h4>
						<div><xsl:value-of select="./description"/></div>
					</li>
					<xsl:for-each select="./document">
						<img src="{filename}" alt="{description}" width="200"/>
						<br/>
						<a href="{filename}">
							<xsl:value-of select="description"/>
						</a>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>
	
	<!-- *************** Test (he-negative findings) *******-->
	<xsl:template name="negativeheuristicissuelist" >
		<a name="negative-all" />
		<h3>5.2 List of all Problems (Negative Findings)</h3>
		<xsl:value-of select="./heuristicissues/description" disable-output-escaping="yes"/>
		<a name="table6" />
		<table>
			<caption>
				<span class="label">Table 6:</span> All negative findings.</caption>
			<thead>
				<tr>
					<th>Description</th>
					<th>Details</th>
					<th>Heuristic</th>
					<th>Issue found (person)</th>
					<th>Severity (person)</th>
					<th>Documents</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="heuristicissues/heuristicissue[direction='down']">
					<xsl:sort select="@id" order="ascending"/>
					<xsl:variable name="hid" select="./@heuristicid" />
					<tr>
						<th>
							<xsl:apply-templates select="./description"/>
						</th>
						<td>
							<xsl:apply-templates select="./notice"/>
						</td>
						<td>
							<xsl:value-of select="@heuristicid"/>:
							<xsl:apply-templates select="//report/heuristic[@id=$hid]/title"/>
						</td>
						<td>
							<xsl:apply-templates select="./found"/>
						</td>
						<td>
							<xsl:apply-templates select="./severity"/>
						</td>
						<td>
							<xsl:for-each select="./document">
								<img src="{filename}" alt="{description}" width="200"/>
								<br/>
								<a href="{filename}">
									<xsl:value-of select="description"/>
								</a>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>

	</xsl:template>

	<xsl:template match="severity">
		<xsl:value-of select="./value"/> (<!--xsl:value-of select="@personid"/-->
		<xsl:variable name="pid" select="@personid" />
		<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>) 
	
	</xsl:template>
	<xsl:template match="found">
		<xsl:if test="value = 'true'">
			y 
		</xsl:if>
		<xsl:if test="value = 'false'">
			n 
		</xsl:if>
		(<xsl:variable name="pid" select="@personid" />
		<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>)<br /> 
		
	</xsl:template>
	
	
	<xsl:template match="tasks/task">
		<li>Task</li> notice=<xsl:apply-templates select="./notice"/>
	</xsl:template>
	
	<!-- *************** Test (he-issues) ************-->	
	<xsl:template match="issues/issue">
		<li>Issue</li> notice=<xsl:apply-templates select="./notice"/>
	</xsl:template>

	<!-- *************** Test (ta-questionnaires) *****-->
	<xsl:template name="questionniareresults">
		
		<h3>3.2 Feedback Questionnaire</h3>
		<p><xsl:value-of select="questionnaireresults/description" disable-output-escaping="yes"/></p>
		<a name="table6" />
		<table id="table6">
			<caption>
				<span class="label">Table 6:</span> Summary of feedback
				questionnaire.</caption>
			<thead>
				<tr>
					<th>Question</th>
					<th>-</th>
					<th>Range</th>
					<th>-</th>
					<th>Severity per Person</th>
					<th>Severity Average</th>
					<th>Severity Std. Dev.</th>
					
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="questionnaireresults/answerforquestion">
					<!--xsl:sort select="@questionid" data-type="number" does now work with question_23/-->
					<xsl:sort select="@questionid" />
					<xsl:variable name="qid" select="./@questionid" />
					<tr>
						<td>
							<!--xsl:apply-templates select="$qid"/--> 							
							<xsl:apply-templates select="//questionnaire/question[@id=$qid]/description"/>
						</td>
						<td> <xsl:apply-templates select="//questionnaire/question[@id=$qid]/rangefrom" /> </td>
						<td> <xsl:apply-templates select="//questionnaire/question[@id=$qid]/rangescale"/> </td>
						<td> <xsl:apply-templates select="//questionnaire/question[@id=$qid]/rangeto"   /> </td>
						<td>
							<xsl:for-each select="./answer">
								<xsl:apply-templates select="./value"/> (<xsl:variable name="pid" select="@personid" />
				<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>)<br /> 
							</xsl:for-each>
						</td>
						<td> <xsl:value-of select="format-number(sum(*) div count(*) ,'#0.00')"/>  </td>
						<td> ... </td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<!-- *************** Test (ta-result-docs: full interviews) *****-->
	<xsl:template name="interviews">
		<a name="interviews" />
		<h3>3.3 Interviews</h3>
		<p><xsl:value-of select="interviews/description" disable-output-escaping="yes"/></p>
		<ol>
		<xsl:for-each select="interviews/interview">
			<li>Interview with
				<xsl:variable name="pid" select="@personid" />
				<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>
			<ul>
			<xsl:for-each select="qanda">
				<xsl:sort select="@id" order="ascending"/>
				<li><b><xsl:value-of select="quest" />:</b><br /><xsl:value-of select="answ" /><br /></li>	
			</xsl:for-each>
			</ul>
			</li>
		</xsl:for-each>
		</ol>
	</xsl:template>

	<!-- *************** Test (ta-result-docs: Test Transcript) *****-->
	<xsl:template name="transcripts">
		<a name="transcripts" />
		<h3>3.4 Test Transcripts</h3>
		<p><xsl:value-of select="transcripts/description" disable-output-escaping="yes"/></p>
		<a name="table7" />
		<table id="table7">
			<caption>
				<span class="label">Table 7:</span> Coding scheme for test protocol.</caption>
			<thead>
				<tr>
					<th>Code</th>
					<th>Event</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="//report/transcripts/eventcodes/eventcode">
					<tr>
						<td><xsl:value-of select="code" /></td>	
						<td><xsl:value-of select="description" /></td>	
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<ol>
			<xsl:for-each select="transcripts/transcript">
				<li>Transcript of test user 
					<xsl:variable name="pid" select="@personid" />
				<xsl:apply-templates select="//report/persons/person[@id=$pid]/alias"/>
					<table>
						<!--caption>
							<span class="label">Transcript</span> of <xsl:value-of select="@personid" />.</caption-->
						<thead>
							<tr>
								<th>Timestamp</th>
								<th>Code</th>
								<th>Event</th>
								<th>Finding</th>
							</tr>
						</thead>
						<tbody>
						<xsl:for-each select="logentry">
							<xsl:sort select="timestamp" order="ascending"/>
							<xsl:variable name="codeid" select="./@eventcodeid" />
							<tr>
							<td><xsl:value-of select="timestamp" /></td>
							<td><xsl:apply-templates select="//report/transcripts/eventcodes/eventcode[@id=$codeid]/code"/></td>	
							<td><xsl:value-of select="description" /></td>
							<td><xsl:value-of select="finding" /></td>
							</tr>
						</xsl:for-each>
						</tbody>
					</table>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>
	
	
	

	
	
	<!-- ************************************************-->
	<!-- *************** TA Analysis Positives **********-->
	<!-- *************** TA Analysis Recommendations ****-->
	<!-- ************************************************-->
	
	<xsl:template match="analysis">
		<a name="analysis" />
		<!--  Positive findings, recommendations and points for discussion  -->
		<xsl:value-of select="./description" disable-output-escaping="yes"/>
		<xsl:call-template name="findinglist" />
	</xsl:template>
	
	
	<xsl:template name="findinglist" >
		
		<xsl:if test="count(finding[@findingtype = 'positive'])">
		<a name="findings-pos" />
		<h3>4.1 Selected Positive Findings</h3>
			<ul>
				<xsl:for-each select="finding">
					<xsl:sort select="@priority" order="ascending"/>
					<xsl:if test="@findingtype = 'positive'">
						<xsl:call-template name="onefindingaslistwithvideo"/>
					</xsl:if>
				</xsl:for-each>
			</ul>
			

		</xsl:if>
		
		<xsl:if test="count(finding[@findingtype = 'recommendation'])">
		<a name="findings-neg" />
		<h3>4.2 List of Recommendations (Negative Findings)</h3>
		<a name="table8" />
		<table id="table8">
			<caption>
				<span class="label">Table 8:</span> List of Recommendations.
			</caption>
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Screenshot/Documents</th>
					<!-- todo: do i need this for fe and he too? -->
					<th>Timestamp (User)</th>
				</tr>
			</thead>
			<tbody>
			<xsl:for-each select="finding">
				<xsl:sort select="@priority" order="ascending"/>
			<xsl:if test="@findingtype = 'recommendation'">
				<xsl:call-template name="onefindingastablewithvideo" />
			</xsl:if>
			</xsl:for-each>
			</tbody>
		</table>
		</xsl:if>
		
		<xsl:if test="count(finding[@findingtype = 'discussion'])">
		<h3>Points of Discussion</h3>
		<table>
			<caption>
				<span class="label">Table Points of discussion.</span>
			</caption>
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Screenshot/Documents</th>
					<!-- todo: do i need this for fe and he too? -->
					<th>Timestamp (User)</th>
				</tr>
			</thead>
			<tbody>
		<xsl:for-each select="finding">
			<xsl:sort select="@priority" order="ascending"/>
			<xsl:if test="@findingtype = 'discussion'">
				<xsl:call-template name="onefindingastablewithvideo"/>
			</xsl:if>
		</xsl:for-each>
			</tbody>
		</table>
		</xsl:if>
	</xsl:template>
	
	
	<!-- *************** Appendix *********************-->
	<xsl:template name="appendix">
		<xsl:value-of select="./appendix/description" disable-output-escaping="yes"/>
		<xsl:call-template name="listdocumentstranscripts" />
		<xsl:call-template name="listdocumentstestusermaterial" />
		<xsl:call-template name="listdocumentsevaluationmaterial" />
		<xsl:call-template name="listvideos" />
		<xsl:call-template name="listdocumentsbiblio" />
	</xsl:template>
	
	
	<!-- *********************************************-->
	<!-- *************** Helpers  ********************-->
	<!-- *********************************************-->	

	<!-- ************* he: finding (no videos) *******-->
	<xsl:template name="onefinding">
		<li><h4>	<xsl:value-of select="./title"/></h4>
			<xsl:value-of select="./description"/>
			<br />
				<xsl:for-each select="./document">
					<a href="{filename}">
						<img src="{filename}" alt="{description}" width="200"/>
						<br/>
						<xsl:value-of select="description"/>
					</a>
				</xsl:for-each>
		</li>
		
	</xsl:template>
	
	<!-- ************* ta: finding (with videos) *******-->
	<xsl:template name="onefindingastablewithvideo" >
		<tr>
			<th>
				<xsl:value-of select="./title"/>
			</th>
			<td>
				<xsl:value-of select="./description"/>
			</td>
			<td>
				<xsl:for-each select="./document">
					<img src="{filename}" alt="{description}" width="200"/>
					<br/>
					<a href="{filename}">
						<xsl:value-of select="description"/>
					</a>
				</xsl:for-each>
			</td>
			<td>
				<!-- TODO:--> <br />
				Videoclip-Timestamp <xsl:value-of select="./timestamp"/>00:00 (TP?)<br />
				00:00 (TP?)
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="onefindingaslistwithvideo" >
		<li>
			<h4><xsl:value-of select="./title"/></h4>
			<xsl:value-of select="./description"/>
			<br />
			<table class="finding">
				<tr>
					<td class="finding">
				<xsl:for-each select="./document">
					<img src="{filename}" alt="{description}" width="200"/>
					<br/>
					<a href="{filename}">
						<xsl:value-of select="description"/>
					</a>
				</xsl:for-each>
			</td>
					<td class="finding">
				<!-- TODO: --> <br />
				Videoclip-Timestamp <xsl:value-of select="./timestamp"/>00:00 (TP?)<br />
				00:00 (TP?)
			</td>
			</tr>
			</table>
		</li>
	</xsl:template>

	<xsl:template name ="listvideos">
		<xsl:if test="count(//video)">
			<a name="videos" />
			<h4>Videos</h4>
			<table>
				<xsl:for-each select="//video">
					<xsl:sort select="description" order="ascending"/>
					<tr>
						<xsl:call-template name="singledocument" />
					</tr>	
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>


	<xsl:template name ="listdocumentstranscripts">
		<xsl:if test="count(//project/report/appendix/document[@listat='transcripts'])">
		<h4>Interviews</h4>
		<table>
			<xsl:for-each select="//project/report/appendix/document[@listat='transcripts']">
				<xsl:sort select="description" order="ascending"/>
				<tr>
						<xsl:call-template name="singledocument" />
				</tr>	
			</xsl:for-each>
		</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name ="listdocumentstestusermaterial">
		<xsl:if test="count(//project/report/appendix/document[@listat='testusermaterial'])">
			<h4>Materials</h4>
			<table>
				<xsl:for-each select="//project/report/appendix/document[@listat='testusermaterial']">
					<xsl:sort select="description" order="ascending"/>
					<tr>
						<xsl:call-template name="singledocument" />
					</tr>	
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name ="listdocumentsevaluationmaterial">
		<xsl:if test="count(//project/report/appendix/document[@listat='evaluationteammaterial'])">
			<h4>Materials</h4>
			<table>
				<xsl:for-each select="//project/report/appendix/document[@listat='evaluationteammaterial']">
					<xsl:sort select="description" order="ascending"/>
					<tr>
						<xsl:call-template name="singledocument" />
					</tr>	
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name ="listdocumentsbiblio">
		<xsl:if test="count(//project/report/appendix/document[@listat='bibliography'])">
			<h4>Bibliography</h4>
			<ul>
				<xsl:for-each select="//project/report/appendix/document[@listat='bibliography']">
					<xsl:sort select="description" order="ascending"/>
					<li>
						<xsl:call-template name="singledocument" />
					</li>	
				</xsl:for-each>
			</ul>
		</xsl:if>
		
	</xsl:template>
	

	<xsl:template name="singledocument">
		<td><xsl:value-of select="description"/></td>
		<td>
		<xsl:if test="@type = 'image'">
			<a href="{filename}">
				<img src="{filename}" alt="{description}" width="200"/>
			</a>
		</xsl:if>
		<xsl:if test="@type = 'link'">
			<a href="{uri}">
				<xsl:value-of select="uri"/>
			</a>
		</xsl:if>
		<xsl:if test="@type = 'doc'"><a href="{filename}">
				<xsl:variable name="fn" select="filename"/>
				<!-- 
					ignore the leading path and maybe the trailing params
					/mediamarkt/images/users.hmtl?7786	
				
				Version a (use regex, BUT this works in Oxygen, but not in browsers): 
				
				<xsl:analyze-string select="{$fn}" regex="(.*)?/(.*)([?].*)?">
					<xsl:matching-substring>
						<xsl:value-of select="regex-group(2)"/>
					</xsl:matching-substring>
					<xsl:non-matching-substring>    
						<xsl:value-of select="filename"/>
					</xsl:non-matching-substring>
				</xsl:analyze-string>
				
				Version b (original value):
				<xsl:value-of select="filename"/>
				
				Version c (create helper templates for pretty print filename without path and get-params):
				-->
		      		<xsl:call-template name="pretty_filename">
				         <xsl:with-param name="value" select="filename"/>
				    </xsl:call-template>
	            </a>
		</xsl:if>
			<xsl:if test="@type = 'bibentry'">
				<xsl:value-of select="reference"/>
				<a href="{uri}">
					<xsl:value-of select="uri"/>
				</a>
			</xsl:if>
		</td>
	</xsl:template>

	<!-- *************** Helpers: formatting date  ********************-->
	<!-- from: 2001-01-01T00:00:00Z to 2001-01-01 00:00:00 -->
	<xsl:template name="FormatDate">
		<xsl:param name="DateTime" />
		<xsl:variable name="ymd">
			<xsl:value-of select="substring($DateTime,1,10)" /> <!-- 2001-01-01 -->
		</xsl:variable>
		<xsl:variable name="tm">
			<xsl:value-of select="substring($DateTime,12,8)" />
		</xsl:variable>
		<xsl:value-of select="$ymd"/>
		<xsl:value-of select="' '"/>
		<xsl:value-of select="$tm"/>
	</xsl:template>
	

	<xsl:template name="pretty_filename">
		<xsl:param name="value"/>
		<!-- first we remove the path until the last slash /dir/subdir/ --> 
		<xsl:variable name="path_removed">
	        <xsl:call-template name="remove_path">
	          <xsl:with-param name="value" select="$value"/>
	        </xsl:call-template>
		</xsl:variable>
		<!-- next we remove any trailing get params ?23345&user=admin -->
		<xsl:variable name="getparams_removed">
	        <xsl:call-template name="remove_getparams">
	          <xsl:with-param name="value" select="$path_removed"/>
	        </xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$getparams_removed"/>
	</xsl:template>
	
	
	
	<xsl:template name="remove_getparams">
		<!-- pretty print by removing path and get-params
			/system/attachments/17/original/orient.html?1326048377
		-->
        <xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="contains($value, '?')">
	       		<xsl:value-of select="substring-before($value, '?')" />
			</xsl:when>
			<xsl:otherwise>
				 <xsl:value-of select="$value" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>

	<xsl:template name="remove_path">
		<!-- pretty print by removing path and get-params
			/system/attachments/17/original/orient.html?1326048377
		Note we use recursion to remove every dir/subdir/subsubdir/...
		-->
    	<xsl:param name="value" />
		<xsl:choose>
			<xsl:when test="contains($value, '/')">
				<xsl:variable name="path_removed">
				    <xsl:call-template name="remove_path">
				         <xsl:with-param name="value" select="substring-after($value, '/')"/>
				    </xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$path_removed"/>
			</xsl:when>
			<xsl:otherwise>
			    <xsl:value-of select="$value" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>


</xsl:stylesheet>

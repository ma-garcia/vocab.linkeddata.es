<%@ page contentType="text/html; charset=iso-8859-1" language="java"  import="java.util.*, parseVocabs.*"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Vocabularios para Datos Abiertos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <script src="assets/js/jquery.js"></script>

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72pcomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="assets/ico/favicon.png">
  </head>

  <body>

    <div class="container">

      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>Vocabularios para Datos Abiertos</h1>
        <p class="lead">En este portal se recoge una lista de vocabularios útiles para la generación de datos abiertos de ciudades en España. Esta lista de vocabularios irá creciendo con los vocabularios que se están desarrollando en el contexto del grupo de trabajo sobre Open Data del Comité AENOR de Normalización CTN178, subcomité SG3 (Gobierno y Movilidad).</p>
      </div>

      <hr>
      
		<%
		
		ProcessVocabs processVocabs = new ProcessVocabs();
		ArrayList<Vocabulary> vocabularies = processVocabs.getVocabularies();
		
		for (int i = 0; i < vocabularies.size() ; i++){
			//print 1 row for each 3 vocabs
			
			Vocabulary currentVocab = vocabularies.get(i);
			
			if (i % 3 == 0){ //if it is th first vocabulary of the row open it
				out.println("<div class=\"row\">");
			}
			
			//print the vocabulary at any case
			%>
			<div class="span4">
	          <h2><a href="<%out.print(currentVocab.uri); %>" target="_blank"><%out.print(currentVocab.title); %></a></h2>
	          <p style="text-align: justify;"><% if (currentVocab.description == null) {
	        	  		out.print("Sería recomendable incluir un dcterms:description o dcelements:description.");
					}
			        else{
			        	out.print(currentVocab.description);
			        }
	          		 %></p>
	          <pstyle="text-align: justify;"><% if (currentVocab.cnRDF && currentVocab.cnHTML){
	        	  		String rdfURI = currentVocab.uriVapourRDF;
	        	  		String htmlURI = currentVocab.uriVapourHTML;
	        	  		out.print("Implementadas buenas prácticas para negociación de contenidos para los formatos <strong>RDF</strong> y <strong>HTML</strong>.");
	        	  		//out.print("Content negotiation enabled for <a href = \"" + rdfURI + "\" target=\"_blank\"><strong>RDF</strong></a> and <a href = \"" + htmlURI + "\" target=\"_blank\"><strong>HTML</strong></a> formats.");
	          		}
	          		else if (currentVocab.cnRDF && !currentVocab.cnHTML){
	          			String rdfURI = currentVocab.uriVapourRDF;
	          			out.print("Implementadas buenas prácticas para negociación de contenidos para formato <strong>RDF</strong>.");
	          			//out.print("Content negotiation enabled for <a href = \"" + rdfURI + "\" target=\"_blank\"><strong>RDF</strong></a> format.");
	          		}
					else if (!currentVocab.cnRDF && currentVocab.cnHTML){
						String htmlURI = currentVocab.uriVapourHTML;
						out.print("Implementadas buenas prácticas para negociación de contenidos para formato <strong>HTML</strong>.");
						//out.print("Content negotiation enabled for <a href = \"" + htmlURI + "\" target=\"_blank\"><strong>RDF</strong></a> format.");
	          		}
					else {}
	          		%></p>
	          <!-- <p><a class="btn" href="<%out.print(currentVocab.uri); %>">Query vocab &raquo;</a></p> -->
	        </div>
			<%
			
			if ((i % 3 == 2) || ( i == vocabularies.size()-1)){ //if it is the third or last vocabulary close the row
				out.println("</div>");
			}
 		}
		
		%>
 
      <hr>

      <footer>
      
      <div class="row">
    	<div class="span10">    		
	        Contacto: ocorcho(at)fi.upm.es
	        <br>
	        Última revisión: Abril 2014
	        <br>
	        Construido con <a href = "http://getbootstrap.com/" target="_blank">Bootstrap</a> utilizando la <a href = "https://github.com/mariapoveda/vocab.linkeddata.es" target="_blank">herramienta</a> desarrollada por <a href = "http://delicias.dia.fi.upm.es/members/mpoveda/" target="_blank">María Poveda</a>.
	        
        </div>
    	<div class="span2">
    		<a href="http://www.oeg-upm.net/" target="_blank"><img src="images/logoOEG.png" alt="OEG logo" /></a>
    	</div>
      </div>

      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/bootstrap-scrollspy.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-carousel.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44835745-1', 'linkeddata.es');
  ga('send', 'pageview');

</script>

  </body>
</html>

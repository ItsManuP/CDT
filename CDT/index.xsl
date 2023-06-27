<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
<xsl:output method="html" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
<html lang="IT">
<head>
<title><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='it']"/></title>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
</head>
<body>
<div class="navbar">
<nav class="navbar navbar-expand-lg bg-body-tertiary">
<div class="container-fluid">
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav me-auto mb-2 mb-lg-0">
<li class="nav-item" >
<a class="list-group-item scroll-to" title="Informazioni" href="#informazioni-sul-progetto"> Informazioni </a></li>
<li><a class="list-group-item scroll-to" title="Descrizione" href="#descrizione-fisica"> Descrizione </a></li>
<li><a class="list-group-item scroll-to" title="Documento" href="#Documento"> Documento </a></li>
<li><a class="list-group-item scroll-to" title="Persone" href="#listPersons"> Lista Persone </a></li>
<li><a class="list-group-item scroll-to" title="Citta" href="#listPlaces"> Lista Città </a></li>
</ul>
</div>
</div>
</nav>
</div>


<main id="main">
        <section id="Home" class="section">
            <div class="section-scroll-icon"><a class="scroll-to" title="Informazioni_progetto"
                    href="#informazioni-sul-progetto"></a>
            </div>
        </section>

        <section id="informazioni-sul-progetto" class="section section-2">
            <div class="wrapper section-wrapper">
                <h2 class="section-title">Informazioni sul progetto</h2>
                <p>Progetto realizzato da Manuel Pilia per l'esame di Codifica di Testi.</p>
                <p>Sono state codificate pagina 40, 41 e 63 del diario di Emanuele Artom</p>
            </div>
        </section>
        <section id="informazioni-sul-documento" class="section">
            <div class="wrapper section-wrapper">
                <h2 class="section-title">Informazioni Documento</h2>
                <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc//tei:msContents"/>
            </div>
        </section>
        <section id="descrizione-fisica" class="section">
            <div class="wrapper section-wrapper">
                <h2 class="section-title">Descrizione del manoscritto</h2>
                <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc//tei:physDesc"/>
            </div>
        </section>

                



<section id="pagine" class="carousel">
<div class="carousel-wrapper wrapper">
<h2 class="carousel-title">Pagine</h2>
<div class="carousel-container">
    <div class="carousel-slides">
        <xsl:apply-templates select="//tei:facsimile" />
    </div>
    
</div>
</div>
</section>


<section>
<div>
<h3>Abbreviazioni = Rosso, Parti Originali = Rosa, Correzioni = Giallo, Parti espanse = Verde, Eliminate = Blu</h3>
</div></section>



<section>
<div class="container">
    <div class="row row-cols-2">
        <div class="col" id="Documento">
        <xsl:apply-templates select="//tei:text[@subtype='diary']//tei:group[@type='full_page']"/>
        </div>
    <div class="row ">
        <div class="col " id="Documento-frasi">
        <xsl:apply-templates select="//tei:text[@subtype='diary']//tei:group[@type='sentences']" />
        </div>
    </div>
</div>
</div>
</section>


<section id="listPersons" class="section section-6">
    <div class="wrapper section-wrapper">
        <h2 class="section-title">Lista delle Persone</h2>
        <div class="listperson">
            <xsl:apply-templates select="//tei:listPerson" />
            <xsl:text>&#xa;</xsl:text>
        </div>
    </div>
</section>


<section id="listPlaces" class="section section-6">
    <div class="wrapper section-wrapper">
        <h2 class="section-title">Lista delle Città</h2>
        <div class="listplace">
            <xsl:apply-templates select="//tei:listPlace"/>
        </div>                        
    </div>
    </section>


            
</main>
</body>
</html>
</xsl:template>

        <xsl:template match="tei:listPlace">

        <xsl:for-each select="tei:place/tei:placeName">

            <xsl:element name="div">
                <xsl:attribute name="class">listplace-entry</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="../tei:placeName/@xml:id"/></xsl:attribute>
                <p>Città:</p>
                <xsl:element name="h4">
                <xsl:attribute name="class">listplace-term</xsl:attribute>
                <xsl:value-of select="."/>
                </xsl:element>

                <p class="listplace-description">

                    <!-- qui abbiamo assegnato id del ogni persone -->
                    <xsl:variable name="currentTermID">
                        <xsl:value-of select="concat('#',tei:placeName/@xml:id)"/>
                    </xsl:variable>

                    <!-- qui facciamo un condizione che id del placeName uguale con target-->
                    <xsl:for-each select="/tei:placeName">
                        <xsl:if test="$currentTermID = @target">
                        <!-- se si prende la parte di placeName-->
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </p>   
                <xsl:element name="h4">
                <p>Paese:</p>           
                <xsl:value-of select="../tei:country"/>
                </xsl:element> 
<br></br>
                </xsl:element> 

        </xsl:for-each>
    </xsl:template>




 <xsl:template match="tei:listPerson">
        <!-- ciclo per ogni persName -->
        <xsl:for-each select="tei:person/tei:persName">

            <xsl:element name="div">
                <!-- assegna un class di listperson-entry -->
                <xsl:attribute name="class">listperson-entry</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="../tei:persName/@xml:id"/></xsl:attribute>
                <p>Nome Cognome:</p>    
                <xsl:element name="h4">
                <xsl:attribute name="class">listperson-term</xsl:attribute>
                <!-- prende xsl:for-each select tei:person/tei:persName e lo printa qui -->
                <xsl:value-of select="."/>
                </xsl:element>

                <p class="listperson-description">

                    <!-- qui assegno id di ogni persona -->
                    <xsl:variable name="currentTermID">
                        <xsl:value-of select="concat('#',tei:persName/@xml:id)"/>
                    </xsl:variable>

                    <!-- qui if id== target-->
                    <xsl:for-each select="/tei:persName">
                        <xsl:if test="$currentTermID = @target">
                        <!-- se si prende la parte di persName-->
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </p>   

                <xsl:element name="h4">
                <p>Sesso:</p>            
                <xsl:value-of select="../tei:sex"/>
                </xsl:element> 
<br></br>
                <xsl:element name="h4">
                <p>Nascita:</p>
                <xsl:if test="not(../tei:birth)">
                <p>Data di nascita non specificata</p>
                </xsl:if>            
                <xsl:value-of select="../tei:birth"/>
                </xsl:element> 
<br></br>

<br></br>
                <xsl:element name="h4">
                <p>Morto:</p>
                        
                <xsl:if test="not(../tei:death)">
                <p>Data di morte non specificata</p>
                </xsl:if>            
                <xsl:value-of select="../tei:death"/>
                </xsl:element> 

            </xsl:element>

        </xsl:for-each>

    </xsl:template>


<xsl:template match="tei:facsimile">
<xsl:for-each select="//tei:surface">
<div class="carousel-slide">
<xsl:element name="img">
<xsl:attribute name="class">carousel-img</xsl:attribute>
<!-- in ogni ciclo prende un url di immagine es: img/pagina40.jpg -->
<xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/>
</xsl:attribute>
<!-- in ogni ciclo prende xml:id del surface esempio: #pagina_quaranta -->
<xsl:attribute name="usemap"># <xsl:value-of select="@xml:id"/>
</xsl:attribute>
<xsl:attribute name="alt">
<xsl:value-of select="@xml:id"/>
</xsl:attribute>
</xsl:element>
</div>
</xsl:for-each>
</xsl:template>



<!-- trascrizioni -->
<xsl:template match="tei:group[@type='transcription']">
<div class="trscgrn-group">
<xsl:apply-templates/>
</div>
</xsl:template>

<!-- frasi completate -->
<xsl:template match="tei:group[@type='frasi']">
<div class="trscgrn-group">
<xsl:apply-templates/>
</div>
</xsl:template>

<!-- Giorni -->
<xsl:template match="tei:ab">
<xsl:element name="div">
<xsl:attribute name="class">giorno-container</xsl:attribute>
<xsl:attribute name="data-same-height">same-height-<xsl:value-of select="@n"/></xsl:attribute>
<xsl:element name="h4">
<xsl:attribute name="class">giorno</xsl:attribute>
<xsl:value-of select="@n" /> novembre 1943
</xsl:element>
<xsl:apply-templates/>
</xsl:element>
</xsl:template>




<!-- Correzioni -->
<xsl:template match="tei:choice/tei:sic">
 <div style="color: yellow;">
<xsl:element name="span">
<xsl:attribute name="class">sic</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>

<!-- Abbreviazione -->
<xsl:template match="tei:abbr">
 <div style="color: red;">
<xsl:element name="span">
<xsl:attribute name="class">abbr</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>

<!-- Testo originale -->
<xsl:template match="tei:orig">
<div style="color: pink">
<xsl:element name="span">
<xsl:attribute name="class">orig</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>

<!-- Tag expan --> 
<xsl:template match="tei:expan" >
<div style="color: green">
<xsl:element name="span">
<xsl:attribute name="class">expan</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>

<!-- Tag reg -->
<xsl:template match="tei:reg">
<xsl:element name="span">
<xsl:attribute name="class">reg</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</xsl:template>

<!-- Aggiunte dell'autore o editoriali -->
<xsl:template match="tei:add | tei:supplied">
<xsl:element name="span">
<xsl:attribute name="class">add</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</xsl:template>

<!-- Cancellature -->
<xsl:template match="tei:del">
<div style="color: blue">
<xsl:element name="span">
<xsl:attribute name="class">del</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>




</xsl:stylesheet>
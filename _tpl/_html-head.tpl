<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="{{ $gimme->language->code }}" id="modernizrcom" class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="title" content="{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}" />
  <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>

  {{* Open Graph protocol metatags for Facebook sharing *}}
  {{ if $gimme->article->defined }}
  <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
  <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
  <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
    {{ list_article_images }}
      <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
    {{ /list_article_images }}
  {{ /if }}
  {{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
  {{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
  <meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
  {{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
  <meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />
  <!-- RSS & Pingback -->
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/" />

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>window.jQuery || document.write("<script src='{{ url static_file="assets/js/libs/jquery.min.js" }}'>\x3C/script>")</script>

  <link rel="apple-touch-icon" href="touch-icon.png">

  {{ if $gimme->article->type_name == "storyteller" }}
    <meta name="author" content="Pete Haughie" />
    <meta name="generator" content="Atom 0.92.0" />
    <link rel="stylesheet" href="{{ url static_file="assets/css/storyteller/storyteller.css?v=1.1.2" }}">
    <link rel="stylesheet" href="{{ url static_file="assets/css/storyteller/jquery.bxslider.css?v=1.0" }}">
    <link rel="shortcut icon" href="{{ url static_file="assets/images/storyteller/favicon.ico" }}">
    <styles>
      <!--
       html, body {
        display: none;
      }
      -->
    </styles>
  {{ else }}
    <meta name="author" content="Ljuba Rankovic" >
    <meta name="generator" content="Bluefish 2.0.3" >
    <link rel="stylesheet" href="{{ url static_file="assets/css/main.css?v=1.0" }}">
    <link rel="stylesheet" href="{{ url static_file="assets/css/skin.css?v=1.0" }}">
    <link rel="shortcut icon" href="favicon.png">
    {{ if $gimme->template->name == "article.tpl" }}
    <!-- styles for fancybox, used on article page -->
    <link rel="stylesheet" href="{{ url static_file='assets/css/fancybox/jquery.fancybox-1.3.4.css' }}" />
    {{ /if }}
    <!-- Video.js -->
    <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
    <script src="http://vjs.zencdn.net/c/video.js"></script>
  {{ /if }}
</head>
<body {{ if $gimme->article->type_name == "storyteller"}}class='longform'{{ /if }}>

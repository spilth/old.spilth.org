---
title: JQuery
layout: note
---

## Basic Setup

    <script type="text/javascript" src="/js/jquery.min.js"></script>

## Do Stuff Once the Page is Loaded

    <script type="text/javascript">
      $(document).ready(function() {
        // Do stuff...
      });
    </script>

## JSON

	<script type="text/javascript">
		$(document).ready(function() {
			loadJSON();
		});

		function loadJSON() {
			$.getJSON('path/to/soething.json', function(data) {
				// Do stuff with data...
			});
		}
	</script>
 
## Create Elements

    

## Add Behavior to Elements



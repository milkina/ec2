 var svgConfig = {
            // Keep all elements/attributes, don't rewrite the markup
            verify_html: false,
            valid_elements: '*[*]',
            extended_valid_elements: 'svg[*],path[*],circle[*],rect[*],line[*],polyline[*],polygon[*],ellipse[*],g[*],defs[*],use[*],symbol[*],text[*],tspan[*],title[*],desc[*],linearGradient[*],radialGradient[*],stop[*],mask[*],marker[*],pattern[*],clipPath[*]',
            valid_children: '+body[svg],+div[svg],+p[svg],+span[svg]',
            // Preserve attribute name case (viewBox, etc.) instead of lowercasing
            schema: 'html5',
            element_format: 'xhtml'
          };

 tinymce.init(Object.assign({
           // add these two lines for absolute urls
            remove_script_host : false,
            convert_urls : false,
            selector: 'textarea#ARTICLE_TEXT',
            plugins: 'code codesample image imagetools link table',
            toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | codesample | code | image | link | table",
            browser_spellcheck: true
          }, svgConfig));
           tinymce.init(Object.assign({
           // add these two lines for absolute urls
            remove_script_host : false,
            convert_urls : false,
            selector: 'textarea#iconText',
            plugins: 'code codesample',
            toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | codesample | code ",
            browser_spellcheck: true
          }, svgConfig));
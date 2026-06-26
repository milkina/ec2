 // SVG attribute names are case-sensitive, but TinyMCE 5 lowercases them when
 // parsing the DOM (viewBox -> viewbox). Restore the correct camelCase on output.
 var svgCamelAttrs = [
            'viewBox', 'preserveAspectRatio', 'gradientUnits', 'gradientTransform',
            'patternUnits', 'patternContentUnits', 'patternTransform',
            'clipPath', 'clipPathUnits', 'markerWidth', 'markerHeight', 'markerUnits',
            'refX', 'refY', 'spreadMethod', 'stdDeviation', 'stopColor', 'stopOpacity',
            'textLength', 'lengthAdjust', 'baseProfile', 'startOffset',
            'xChannelSelector', 'yChannelSelector', 'tableValues', 'kernelMatrix',
            'numOctaves', 'baseFrequency', 'stitchTiles', 'pathLength'
          ];

 function fixSvgAttrCase(html) {
            if (!html || html.indexOf('<svg') === -1 && html.indexOf('<SVG') === -1) {
              return html;
            }
            svgCamelAttrs.forEach(function (attr) {
              // Match the attribute name only at a word boundary before '='
              var re = new RegExp('(\\s)' + attr + '(\\s*=)', 'gi');
              html = html.replace(re, '$1' + attr + '$2');
            });
            return html;
          }

 var svgConfig = {
            // Keep all elements/attributes, don't rewrite the markup
            verify_html: false,
            valid_elements: '*[*]',
            extended_valid_elements: 'svg[*],path[*],circle[*],rect[*],line[*],polyline[*],polygon[*],ellipse[*],g[*],defs[*],use[*],symbol[*],text[*],tspan[*],title[*],desc[*],linearGradient[*],radialGradient[*],stop[*],mask[*],marker[*],pattern[*],clipPath[*]',
            valid_children: '+body[svg],+div[svg],+p[svg],+span[svg]',
            schema: 'html5',
            element_format: 'xhtml',
            setup: function (editor) {
              // Fix case when content is read out (form submit, code dialog, getContent)
              editor.on('GetContent', function (e) {
                e.content = fixSvgAttrCase(e.content);
              });
            }
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
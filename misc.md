# misc

```nu
cat langs.md
| mdq "# Main 'puter
| -" --output json
| from json
| get items
| flatten
| flatten
| flatten
| flatten
| get paragraph
| each {|elem| $elem
| split column " — "}
| flatten
| get column1
```

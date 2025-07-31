exec >report.txt

echo "Отчет о логе веб-сервера"
echo "======================"

line_count=0
while read -r line; do
   line_count=$((line_count + 1))
done < access.log
echo "Общее количество строк $line_count"
echo -n "Количество уникальных IP: "
awk '{print $1}' access.log | wc -l

echo "Количество запросов по методам:"

echo -n "GET ="
awk '/GET/' access.log | uniq -c | wc -l
echo -n "POST ="
awk '/POST/' access.log | uniq -c | wc -l
awk 'max < ++c[$7] {max = c[$7]; line = $7} END {print "Самый популярный URL: " max  line}' access.log



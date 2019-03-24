#!/usr/bin/python
from subprocess import run, PIPE
import re
import datetime
from pprint import pprint

def main():
    gcalcli_proc = run(['gcalcli', 'agenda', '--tsv'], stdout=PIPE)
    now = datetime.datetime.now()
    in_x_hours = now + datetime.timedelta(hours=6)

    items = parse_items(gcalcli_proc.stdout.decode())

    # Filter items in the past
    items = filter(lambda item: item['end'] > now, items)

    # Filter items too far away in the future
    items = filter(lambda item: item['start'] < in_x_hours, items)

    pprint(list(items))


    
def parse_items(out):
    agenda_items = []
    for agenda_item in out.split("\n"):
        m = re.match('^(\d{4}-\d{2}-\d{2})\s+(\d{2}:\d{2})\s+(\d{4}-\d{2}-\d{2})\s+(\d{2}:\d{2})\s+(.*?)$', agenda_item)
        if m:
            start_date = m.group(1)
            start_time = m.group(2)
            end_date = m.group(3)
            end_time = m.group(4)
            title = m.group(5)

            start_datetime = datetime.datetime.fromisoformat(start_date + " " + start_time)
            end_datetime = datetime.datetime.fromisoformat(end_date + " " + end_time)

            agenda_items.append({
                'start': start_datetime,
                'end': end_datetime,
                'title': title,
            })

    return agenda_items

if __name__ == "__main__":
    main()

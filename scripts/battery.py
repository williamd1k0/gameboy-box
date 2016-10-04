import power


class InvalidInfoException(Exception):
    pass

power_types = [
    "AC",
    "BATTERY",
    "UPS"
]

power_warnings = [
    "NONE",
    "EARLY",
    "FINAL"
]

def main(info):
    if info in ('type', 'time', 'timeh', 'warn'):
        battery = power.PowerManagement()
        if info == 'type':
            print(get_power_type(battery))
        elif info == 'time':
            print(get_time_remaining(battery, 'm'))
        elif info == 'timeh':
            print(get_time_remaining(battery, 'h'))
        else:
            print(get_warning_level(battery))

    else:
        raise InvalidInfoException()


def get_power_type(battery):
    return power_types[battery.get_providing_power_source_type()]

def get_time_remaining(battery, mode='m'):
    time = battery.get_time_remaining_estimate()
    if time > 0:
        if mode == 'm':
            return time
        elif mode == 'h':
            h, m = divmod(time, 60)
            return "{}:{}".format(int(h), int(m))
    else:
        return time


def get_warning_level(battery):
    return power_warnings[battery.get_low_battery_warning_level()-1]


if __name__ == '__main__':

    import argparse
    
    parser = argparse.ArgumentParser()
    
    parser.add_argument('info', help='Set which info you want')
    args = parser.parse_args()

    try:
        main(args.info)
    except InvalidInfoException as ime:
        print("Invalid info name")
        parser.print_help()
    
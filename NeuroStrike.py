import time
import krakenex
import json
import logging

logging.basicConfig(level=logging.INFO)

with open('config.json') as f:
    config = json.load(f)

k = krakenex.API()
k.key = config['api_key']
k.secret = config['api_secret']

def get_price(pair):
    res = k.query_public('Ticker', {'pair': pair})
    return float(res['result'][list(res['result'].keys())[0]]['c'][0])

def place_order(pair, volume, side):
    order = {
        'pair': pair,
        'type': side,
        'ordertype': 'market',
        'volume': volume
    }
    return k.query_private('AddOrder', order)

entry_price = get_price(config['trade_pair'])
logging.info(f"Entry price: {entry_price}")

while True:
    current_price = get_price(config['trade_pair'])
    change = ((current_price - entry_price) / entry_price) * 100

    logging.info(f"Current price: {current_price} | Change: {change:.2f}%")

    if change >= config['profit_target']:
        logging.info("Profit target hit. Selling.")
        place_order(config['trade_pair'], config['order_size'], 'sell')
        break

    if change <= -config['stop_loss']:
        logging.info("Stop loss hit. Selling.")
        place_order(config['trade_pair'], config['order_size'], 'sell')
        break

    time.sleep(config['poll_interval'])

def lambda_handler(event, context):
    greet = f'Hello {event["name"]}!'
    return {
        'greet': greet
    }


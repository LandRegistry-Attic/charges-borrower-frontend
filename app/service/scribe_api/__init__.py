from . import implementation, interface


def make_scribe_client():
    return interface.ScribeApiInterface(implementation)

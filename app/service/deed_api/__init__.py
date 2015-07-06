from . import implementation, interface


def make_deed_client():
    return interface.DeedApiInterface(implementation)

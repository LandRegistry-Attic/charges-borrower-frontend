from . import implementation, interface


def make_client():
    return interface.DeedApiInterface(implementation)

class DeedApiInterface(object):
    def __init__(self, implementation):
        self.implementation = implementation

    def get_deed(self, md_ref):
        return self.implementation.get_deed(md_ref)

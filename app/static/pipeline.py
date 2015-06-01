from flask.ext.assets import Bundle
from os import path
import sass as libsass


__dot = path.dirname(path.realpath(__file__))
__toolkit_dir = path.join(__dot, 'govuk_frontend_toolkit/stylesheets/')
__elemets_dir = path.join(__dot, 'sass/elements/')


def __compile_sass(_in, out, **kw):
    out.write(
        libsass.compile(
            string=_in.read(),
            include_paths=[__toolkit_dir, __elemets_dir]
        )
    )


sass = Bundle('sass/main.scss',
              filters=(__compile_sass,), output='gen/main.css')

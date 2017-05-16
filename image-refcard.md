% Racket 2htdp/image library quick reference

## Images created from basic shapes

All of these commands produce an object of _image_ type. For a list of allowed
_colors_ see the documentation.

-------------------------------------------------------------------------------------------------------------
Shape                                                              Description
------------------------------------------------------------------ ------------------------------------------
`(`**`circle`** _radius_ _mode_ _color_`)`                         Circle

`(`**`ellipse`** _width_ _height_ _mode_ _color_`)`                Ellipse

`(`**`triangle`** _side-length_ _mode_ _color_`)`                  Upward-pointing equilateral triangle

`(`**`square`** _side-len_ _mode_ _color_`)`                       Square

`(`**`rectangle`** _width_ _height_ _mode_ _color_`)`              Rectangle

`(`**`rhombus`** _side-length_ _angle_ _mode_ _color_`)`           Rhombus

`(`**`star`** _side-length_ _mode_ _color_`)`                      Five-pointed star

`(`**`line`** _x1_ _y1_ _color_`)`                                 Line from $(0,0)$ to $(x1, y1)$

`(`**`text`** _string_ _fontsize_ _color_ `)`                      Text 

-------------------------------------------------------------------------------------------------------------


## Images created from more complex shapes

-------------------------------------------------------------------------------------------------------------
Shape                                                              Description
------------------------------------------------------------------ ------------------------------------------
`(`**`right-triangle`** _side-length1_ _side-length2_              Right-angled triangle
    _mode_ _color_`)` 

`(`**`isosceles-triangle`** _side-length_ _angle_                  Isosceles triangle, with angle _angle_ 
    _mode_ _color_`)`                                              between the equal sides

`(`**`triangle/sss`** _side-length-a_ _side-length-b_              A triangle, all of whose sides are known 
    _side-length-c_ _mode_ _color_`)`

**`triangle/ass`**, **`triangle/sas`**, **`triangle/ssa`**         A triangle, given two sides and their
                                                                   included angle
                                                                   
**`triangle/aas`**, **`triangle/asa`**, **`triangle/saa`**         A triangle, given two angles and their
                                                                   shared side
                                                                   
`(`**`star-polygon`** _side-length_ _side-count_ _step-count_      A _side-count_-pointed star
    _mode_ _color_`)`

`(`**`radial-star`** _point-count_ _inner-radius_ _outer-radius_   Another kind of star
    _mode_ _color_`)`

`(`**`regular-polygon`** _side-length_ _side-count_                Regular polygon
    _mode_ _color_`)`

`(`**`pulled-regular-polygon`** _side-length_ _side-count_         Regular polygon with curved sides
    _pull_ _angle_ _mode_ _color_`)`

`(`**`polygon`** _vertices_  _mode_ _color_`)`                     Arbitrary shape. _vertices_ is a list of 
                                                                   `posn` or `pulled-point`

`(`**`text/font`** _string_ _font-size_ _color_                    Text (more control over font)
    _face_ _family_ _style_ _weight_ _underline?_ `)`

-------------------------------------------------------------------------------------------------------------


## Adding shapes to images

There are two variations to some of these: `add-X` adds the shape `X` to an
image and grows the image size if necessary, whereas `scene+X` will clip `X`
to the bounding-box of the image.

-------------------------------------------------------------------------------------------------------------
Command                                                            Description
------------------------------------------------------------------ ------------------------------------------
`(`**`add-line`** _image_ _x1_ _y1_ _x2_ y_2_ _color`)`            Add line, growing image if necessary

`(`**`scene+line`** _scene_ _x1_ _y1_ _x2_ y_2_ _color`)`          Like `add-line` but crop if necessary

`(`**`add-curve`** _image_                                         Add curve, growing image if necessary
                   _x1_ _y1_ _angle1_ _pull1_ 
                   _x2_ y2_ _angle2_ _pull2_ 
                   _color`)`
                   
`(`**`scene+curve`** ... `)`                                       Like `add-curve` but crop if necessary

`(`**`add-solid-curve`** _image_ ... `)`                           Like `add-curve` but fills in interior 

`(`**`add-polygon`** _image_ _posns_ _mode_ _color_`)`             Add a polygon. _posns_ is a list of `posn`

`(`**`scene+polygon`** _image_ _posns_ _mode_ _color_`)`           Like `add-polygon` but crop if necessary

`(`**`add-solid-curve`** _image_ ... `)`                           Like `add-curve` but fills in interior 

`(`**`add-solid-curve`** _image_ ... `)`                           Like `add-curve` but fills in interior 
------------------------------------------------------------------------------------------------------------- 


## Putting one image on top of another

_x-place_ is one of `"left"`, `"right"`, `"middle"`, `"center"`, or `"pinhole"`. _y-place_
is one of `"top"`, `"bottom"`, `"middle"`, `"center"`, `"baseline"`, or `"pinhole"`.

Note: All of these have an equivalent `underlay` variation, which puts the first image on the bottom.

-------------------------------------------------------------------------------------------------------------
Command                                                            Description
------------------------------------------------------------------ ------------------------------------------
`(`**`overlay`** _i1_ _i2_ ... `)`                                 Overlay all the images, first one on top,
                                                                   centred left/right and top/bottom

`(`**`overlay/align`** _x-place_ _y-place_ _i1_ _i2_ ... `)`       Like `overlay` but aligned top, left, etc

`(`**`overlay/offset`** _i1_ _x_ _y_ _i2_`)`                       Like `overlay` but shift _i2_ by _x_ to 
                                                                   the right and _y_ down

`(`**`overlay/align/offset`** _x-place_ _y-place_                  Like `overlay/align` but shift _i2_ by _x_ 
    _i1_ _x_ _y_ _i2_`)`                                           to the right and _y_ down
                                                                   
`(`**`overlay/xy`** _i1_ _x_ _y_ _i2_`)`                           Like `overlay/offset` but start with the 
                                                                   images lined up by their top-left corners
------------------------------------------------------------------------------------------------------------- 


## Putting one image next to another

-------------------------------------------------------------------------------------------------------------
Command                                                            Description
------------------------------------------------------------------ ------------------------------------------
`(`**`beside`** _i1_ _i2_ ... `)`                                  Place all images in a horizontal row, 
                                                                   aligned by their centres
                                                                   
`(`**`beside/align`** _y-place_ _i1_ _i2_ ... `)`                  Place all images in a horizontal row, 
                                                                   aligned by _y-place_

`(`**`above`** _i1_ _i2_ ... `)`                                   Place all images in a vertical column, 
                                                                   aligned by their centres
                                                                   
`(`**`above/align`** _x-place_ _i1_ _i2_ ... `)`                   Place all images in a vertical column, 
                                                                   aligned by _x-place_
------------------------------------------------------------------------------------------------------------- 


## Placing images into scenes

These crop the placed image to the underlying scene.

-------------------------------------------------------------------------------------------------------------
Command                                                            Description
------------------------------------------------------------------ ------------------------------------------
`(`**`empty-scene`** _width_ _height_`)`                           Create an empty scene

`(`**`empty-scene`** _width_ _height_ _color_`)`                   Create an empty scene filled with a colour

`(`**`place-image`** _image_ _x_ _y_ _scene_`)`                    Place _image_ in _scene_, with its centre 
                                                                   at (_x_, _y_), and crop

`(`**`place-image/align`** _image_ _x_ _y_ _x-place_ _y-place_     Place _image_ in _scene_, with its _x-place_ 
    _scene_`)`                                                     and _y-place_ at (_x_, _y_), and crop
    
`(`**`place-images`** _images_ _posns_ _scene_`)`                  Place multiples images in _scene_. _images_ 
                                                                   and _posns_ are lists

`(`**`place-images/align`** _images_ _posns_                       Like `place-images` but images are aligned
    _x-place_ _y-place_ _scene_`)`


------------------------------------------------------------------------------------------------------------- 


## Image transformations

-------------------------------------------------------------------------------------------------------------
Transformation                                                     Description
------------------------------------------------------------------ ------------------------------------------
`(`**`rotate`** _angle_ _image_`)`                                 Rotate _image_ anti-clockwise

`(`**`scale`** _factor_ _image_`)`                                 Scale _image_ by _factor_

`(`**`scale/xy`** _x-factor_ _y-factor_ _image_`)`                 Scale _image_ by _x-factor_ horizontally
                                                                   and _y-factor_ vertically

`(`**`flip-horizontal`** _image_`)`                                Flip _image_ left to right

`(`**`flip-vertical`** _image_`)`                                  Flip _image_ top to bottom

`(`**`crop`** _x_ _y_ _width_ _height_ _image_`)`                  Crop image from (_x_, _y_)

`(`**`crop/align`** _x-place_ _y-place_                            Crop image from _x-place_ and _y-place_
    _width_ _height_ _image_`)`

`(`**`frame`** _image_`)`                                          Draw a black frame around the bounding-box

`(`**`color-frame`** _color_ _image_`)`                            Draw a coloured frame around the image
-------------------------------------------------------------------------------------------------------------


## Properties of images

-------------------------------------------------------------------------------------------------------------
Property                                                           Description
------------------------------------------------------------------ ------------------------------------------
`(`**`image-width`** _image_`)`                                    The width of _image_

`(`**`image-height`** _image_`)`                                   The height of _image_

`(`**`image-baseline`** _image_`)`                                 The distance from the top of image to its
                                                                   baseline
------------------------------------------------------------------------------------------------------------

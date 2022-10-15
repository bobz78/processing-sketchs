This sketch is suppose to be a collision/softbody pyhsics where you have
cricle/sphere collider that bounces and losses force gradualy as well as
a rectangle/cube collider that behaves with corect pyhsics meaing when hit
from top left it falls back/rotates and if its hit from bottom left falls
forward/rotates and the exact opposite when its hit from right side.
most of my time on this project was spent on how to simulate fallin with
rotation as processing handels rotation either from top left corner or from
the center of the shap, however after many tries I figured out that I can use
negative values for hieght and width of rect() funtion and that allows me to 
pick which corner the shape will rotate from to simulate actual falling by
rotation, instead of the object rotating from center and then falling.

Im still working this project as im very intrested in physics simulations 
and I understand that there are still much work to be done to make the 
collision better but I hope this atleast showcases the idea i had.
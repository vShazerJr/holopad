Some people are getting confused about the new Holopad E2 export format so here's a quick-start tutorial on how to understand and write code for the new exported code.





# **Export 2** #

Here's an example export of a holo model using Export 2;

```c

```
@name Holopad Export

#####
# Holograms authored by Unnamed on 28/08/2012
# Exported from Holopad 26/08/2012 by Bubbus
# Thanks to Vercas for the original E2 export template!
#
# FOR AN EXPLANATION OF THE CODE BELOW, VISIT http://code.google.com/p/holopad/wiki/NewE2ExportFormatHOWTO
##### 

#####
# Hologram spawning data
@persist [Holos Clips]:table HolosSpawned HolosStep LastHolo TotalHolos
@persist E:entity
#####


if (first() | duped())
{
    E = entity()

    function number addHolo(Pos:vector, Scale:vector, Colour:vector4, Angles:angle, Model:string, Material:string, Parent:number)
    {
        if (holoRemainingSpawns() < 1) {error("This model has too many holos to spawn! (" + TotalHolos + " holos!)"), return 0}
        
        holoCreate(LastHolo, E:toWorld(Pos), Scale, E:toWorld(Angles))
        holoModel(LastHolo, Model)
        holoMaterial(LastHolo, Material)
        holoColor(LastHolo, vec(Colour), Colour:w())

        if (Parent > 0) {holoParent(LastHolo, Parent)}
        else {holoParent(LastHolo, E)}

        local Key = LastHolo + "_"
        local I=1
        while (Clips:exists(Key + I))
        {
            holoClipEnabled(LastHolo, 1)
            local ClipArr = Clips[Key+I, array]
            holoClip(LastHolo, I, holoEntity(LastHolo):toLocal(E:toWorld(ClipArr[1, vector])), holoEntity(LastHolo):toLocalAxis(E:toWorldAxis(ClipArr[2, vector])), 0)
            I++
        }
        
        return LastHolo
    }

    ##########
    # HOLOGRAMS
    

    #[      ]#    Holos[1, array] = array(vec(-0.0000, 7.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[2, array] = array(vec(0.0000, -0.2164, 1.0000), vec(0.5000, 0.9000, 0.2000), vec4(255, 255, 255, 255), ang(-0.0000, -90.0000, 0.0000), "right_prism", "", 0)
        Clips["2_1", array] = array(vec(0.0374, -1.0455, 1.0000), vec(-0.0408, 0.9045, 0.4245))
    #[      ]#    Holos[3, array] = array(vec(-0.0000, 1.0000, 0.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[4, array] = array(vec(0.0000, 13.0000, 1.0000), vec(0.9000, 1.7000, 0.2000), vec4(255, 255, 255, 255), ang(0.0000, 0.0000, 0.0000), "cube", "", 0)
    #[      ]#    Holos[5, array] = array(vec(-0.0000, 13.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[6, array] = array(vec(-0.0000, 4.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[7, array] = array(vec(-0.0000, 21.0000, 0.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[8, array] = array(vec(-0.0000, 10.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[9, array] = array(vec(-0.0000, 16.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[10, array] = array(vec(0.0000, 13.0000, 3.0000), vec(0.8018, 0.8018, 0.4000), vec4(255, 255, 255, 255), ang(0.0000, 0.0000, 0.0000), "hq_rcylinder_thick", "", 0)
    #[      ]#    Holos[11, array] = array(vec(-0.0000, 19.0000, -2.0000), vec(0.1981, 0.1981, 1.0000), vec4(255, 255, 255, 255), ang(-90.0000, 0.0000, 0.0000), "hq_cylinder", "", 0)
    #[      ]#    Holos[12, array] = array(vec(0.0000, 13.0000, 1.0000), vec(0.7000, 1.0000, 0.3000), vec4(255, 255, 255, 255), ang(0.0000, 0.0000, 0.0000), "hq_rcube_thick", "", 0)
    #[      ]#    Holos[13, array] = array(vec(0.0000, 4.0000, 4.0000), vec(0.1035, 0.1035, 0.8000), vec4(255, 255, 255, 255), ang(-0.0000, 0.0000, 90.0000), "hq_tube_thick", "", 0)
    
    ##########
    
    TotalHolos = Holos:count()
    if (1 > holoClipsAvailable()) {error("A holo has too many clips to spawn on this server! (Max is " + holoClipsAvailable() + ")")}
}


#You may place code here if it doesn't require all of the holograms to be spawned.


if (HolosSpawned)
{
    #Your code goes here if it needs all of the holograms to be spawned!
}
else
{
    while (LastHolo <= Holos:count() & holoCanCreate() & perf())
    {
        local Ar = Holos[LastHolo, array]
        addHolo(Ar[1, vector], Ar[2, vector], Ar[3, vector4], Ar[4, angle], Ar[5, string], Ar[6, string], Ar[7, number])
        LastHolo++
    }
    
    if (LastHolo > Holos:count())
    {
        Holos:clear()
        Clips:clear()
        HolosSpawned = 1
        E:setAlpha(0)
    }

    interval(1000)
}
```
```


This may be difficult to understand at first, so I'll break it down into chunks and explain each part;




## Chunk 1: **addHolo** ##



```c

```
function number addHolo(Pos:vector, Scale:vector, Colour:vector4, Angles:angle, Model:string, Material:string, Parent:number)
    {
        if (holoRemainingSpawns() < 1) {error("This model has too many holos to spawn! (" + TotalHolos + " holos!)"), return 0}
        
        holoCreate(LastHolo, E:toWorld(Pos), Scale, E:toWorld(Angles))
        holoModel(LastHolo, Model)
        holoMaterial(LastHolo, Material)
        holoColor(LastHolo, vec(Colour), Colour:w())

        if (Parent > 0) {holoParent(LastHolo, Parent)}
        else {holoParent(LastHolo, E)}

        local Key = LastHolo + "_"
        local I=1
        while (Clips:exists(Key + I))
        {
            holoClipEnabled(LastHolo, 1)
            local ClipArr = Clips[Key+I, array]
            holoClip(LastHolo, I, holoEntity(LastHolo):toLocal(E:toWorld(ClipArr[1, vector])), holoEntity(LastHolo):toLocalAxis(E:toWorldAxis(ClipArr[2, vector])), 0)
            I++
        }
        
        return LastHolo
    }
```
```


### Error Checking ###

addHolo is used to create each holo that you've made inside Holopad.
The first line does exception checking to make sure we can spawn the model;

```c

```
if (holoRemainingSpawns() < 1) {error("This model has too many holos to spawn! (" + TotalHolos + " holos!)"), return 0}
```
```

If the remaining number of spawnable holos is ever 0 (e.g. less than 1), then we cannot add a holo, and therefore we cannot finish spawning the model.


### Holo creation ###

```c

```
        holoCreate(LastHolo, E:toWorld(Pos), Scale, E:toWorld(Angles))
        holoModel(LastHolo, Model)
        holoMaterial(LastHolo, Material)
        holoColor(LastHolo, vec(Colour), Colour:w())
```
```

Here, we create the holo and apply its characteristics.  Notice the usage of E:toWorld.  The holos are spawned _local_ to E (the E2 chip).  This means that the model will spawn at the same angles as the E2 chip - useful for a range of purposes.


### Parenting ###

```c

```
        if (Parent > 0) {holoParent(LastHolo, Parent)}
        else {holoParent(LastHolo, E)}
```
```

In this segment we figure out how to parent the holo.  If you didn't define a parent for the holo inside Holopad, the holo becomes parented to the E2 chip - allowing you to move the holo model around with the E2 chip.  You can modify this segment in many ways to produce different behaviour.  If you want your holo model to stay still after spawning, remove the _else_ line.  If you want to parent all of your holos to a single holo so you can use holoPos to move the entire model, replace the segment with this one;

```c

```
# Place this in the E2 definitions;
@persist BASEHOLO

# Place this line at the top of the first() block;
BASEHOLO = <any holo number>

        if (Parent > 0) {holoParent(LastHolo, Parent)}
        elseif (LastHolo != BASEHOLO) {holoParent(LastHolo, BASEHOLO)}
```
```


### Clipping Planes ###

```c

```
        local Key = LastHolo + "_"
        local I=1
        while (Clips:exists(Key + I))
        {
            holoClipEnabled(LastHolo, 1)
            local ClipArr = Clips[Key+I, array]
            holoClip(LastHolo, I, holoEntity(LastHolo):toLocal(E:toWorld(ClipArr[1, vector])), holoEntity(LastHolo):toLocalAxis(E:toWorldAxis(ClipArr[2, vector])), 0)
            I++
        }

        return LastHolo
```
```

In the Hologram definitions (see below), we create clip plane definitions.  Clip planes are stored by a string index of the format "<Holo number>`_`<Clip number>".  In the segment above, we use this fact along with a loop to discover all of the clip planes that belong to the holo (if any exist), and then apply the clipping planes to the holo.

After we've applied the clipping planes, the holo is fully created.  We can return the Holo's index and then exit the function.


## Chunk 2: **Hologram Definitions** ##

Notice the addHolo function header;

```c

```
function number addHolo(Pos:vector, Scale:vector, Colour:vector4, Angles:angle, Model:string, Material:string, Parent:number)
```
```

This header defines the order in which the holo information appears in the holo definitions.  Positon first, then Scale second, Colour third...
The holo index is the same as the holo's array index.

Therefore, the holo definitions follow this form;

```c

```
#[ <Holo's name> ]#    Holos[<Holo index>, array] = array(Position, Scale, Colour, Angles, Model, Material, Parent)
```
```

Notice that the colour is stored as a 4-dimensional vector.  The XYZW elements translate to RGBA respectively.  Model can be a holo model name or, if holoModelAny is installed, it may be a full model path.  Parent may be any number in the holo indices, or 0 to represent "no parent".

### Clip definitions ###

Although less obvious than the Holo definitions, the Clip definitions follow this form;

```c

```
Clips["<Holo index>_<Clip index>", array] = array(Clip center position, Clip normal direction)
```
```

As mentioned in the addHolo section, the Clip index is the parent holo's number and the clip's number, separated by an underscore.


## Chunk 3: **Custom code** ##

```c

```


#You may place code here if it doesn't require all of the holograms to be spawned.


if (HolosSpawned)
{
    #Your code goes here if it needs all of the holograms to be spawned!
}
```
```

Can't say much more than the comments do.  The code in the second part only gets run once all of the holograms have finished being spawned.  You should only use the first part for code which doesn't use the holos, or code that automatically detects which holos are currently spawned.


## Chunk 4: **Holo spawn loop** ##

```c

```
else
{
    while (LastHolo <= Holos:count() & holoCanCreate() & perf())
    {
        local Ar = Holos[LastHolo, array]
        addHolo(Ar[1, vector], Ar[2, vector], Ar[3, vector4], Ar[4, angle], Ar[5, string], Ar[6, string], Ar[7, number])
        LastHolo++
    }
    
    if (LastHolo > Holos:count())
    {
        Holos:clear()
        Clips:clear()
        HolosSpawned = 1
        E:setAlpha(0)
    }

    interval(1000)
}
```
```

This code runs every second while the holos haven't finished spawning.  If your holo model is huge (on most servers, if your model uses more than 30 holos) then the chip may take multiple seconds to finish spawning your model.

### The loop ###

```c

```
    while (LastHolo <= Holos:count() & holoCanCreate() & perf())
    {
        local Ar = Holos[LastHolo, array]
        addHolo(Ar[1, vector], Ar[2, vector], Ar[3, vector4], Ar[4, angle], Ar[5, string], Ar[6, string], Ar[7, number])
        LastHolo++
    }
```
```

This is where the work gets done.  While we are still able to process holos (holoCanCreate tells us if we're still allowed to spawn holos, and perf() tells us when to take a break to stop us breaking the chip ), we select a holo from the holo definitions and we create it.  This allows us to create as many holos as we can in a single go.


### Checking afterwards ###

```c

```
    if (LastHolo > Holos:count())
    {
        Holos:clear()
        Clips:clear()
        HolosSpawned = 1
        E:setAlpha(0)
    }

    interval(1000)
```
```

After we're done in the loop above, we need to check where we stopped because we can exit the loop for three reasons - we've achieved success, we've temporarily run out of holos or we've been working too hard.  Because we only care about success, we check to see if we've spawned the last holo.  Because we spawn the holos in order, all we have to do is check if the last holo has been spawned.  If it has, we declare success and we clean up the holo and clip definitions to save space.

Regardless of what happens, we pause the chip for a second to allow the ops to "cool down" and allow our holo allowance to reset.  This has the side effect of stopping the chip after success - the side effects are beneficial here also.




# **How to use the holos in your code** #

Because the indices in the Holos array correspond directly to the holo index once spawned, you can use the Holos index in your code.

For example, we find the pointer holo in a speedometer and rotate it to display the speed; (thanks to [irontires](http://facepunch.com/member.php?u=423354) for this example)

```c

```
#[ pointer ]#   Holos[6, array] = array(vec(0.0000, -32.9132, 41.2338), vec(0.3000, 0.3000, 13.0740), vec4(255, 255, 255, 255),ang(0.0000, 180.0000, 0.0000), "hq_rcylinder", "", 0)

...

if (HolosSpawned)
{
    #Your code goes here if it needs all of the holograms to be spawned!

    local Degrees = (Car:vel():length() / MaxSpeed) * 360

    holoAng(6, E:toWorld(ang(0,Degrees,0)))
}
```
```

**BE AWARE:**  The holo indices do not stay the same when you export!  If your pointer holo is 6, it might change to be number 2 or 5 or 10000 the next time you export to E2.  Therefore, it is good practice to use CONSTANTS to store your holo indices.  Here's an example;

```c

```
@persist POINTER

if (first())
{
    ...

    #[ pointer ]#   Holos[6, array] = array(vec(0.0000, -32.9132, 41.2338), vec(0.3000, 0.3000, 13.0740), vec4(255, 255, 255, 255),ang(0.0000, 180.0000, 0.0000), "hq_rcylinder", "", 0)

   POINTER = 6
}

...


if (HolosSpawned)
{
    #Your code goes here if it needs all of the holograms to be spawned!

    local Degrees = (Car:vel():length() / MaxSpeed) * 360

    holoAng(POINTER, E:toWorld(ang(0,Degrees,0)))
}
```
```

Notice that in holoAng, we use the constant named POINTER instead of the number 6.  Because we store 6 inside POINTER, it means the same thing when the chip is run.  But here's the important part - when you copy/paste the code from an old export to a new export (and the pointer's new index becomes 2), all you have to do is change `POINTER = 6` to `POINTER = 2` and _the code will still work!_  This is good practice and I won't apologize for causing people to adopt it.  This is also a good example of why _**you should give names to your important holos!**_  It is _very_ difficult to figure out where your important holos are if they don't have names.




# Final words #

I hope I've demonstrated that Export 2 isn't too scary if you understand all the parts, and that writing code for your Holopad exports is easier than ever!  Thanks for using Holopad and I wish you luck and fun in all your projects with it.
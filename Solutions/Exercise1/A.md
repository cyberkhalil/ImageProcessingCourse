A) Answer the following questions:
    1. Define:
        a. Digital image
            is a representation of a two-dimensional image as a finite set of
            digital values, called picture elements.
        
        b. Digital image processing
            is a method to perform some operations on an image, in order to 
            enhance it or to extract some information from it.
        
        c. Pixel
            is the term used most widely to denote the elements of a 
            digital image.
            
        d. Image restoration
            is the operation of taking a corrupt/noisy image and estimating 
            the clean, original image.
            
        e. Image segmentation
            is the process of partitioning a digital image into multiple 
            segments sets of pixels.
            
        f. Image compression
            is a type of data compression applied to digital images, to reduce 
            their cost for storage or transmission.
            
    2. Make a comparison between:
        a. Low-, middle-, and high-level digital image processing.
           ---------------------------------------------------------------------
           |      Low-level        |     Middle-level    |      High-level     |
           ---------------------------------------------------------------------
operations | primitive operations  |    segmentation     | cognitive functions |
 inputs    |       images          |       images        |       images        |
 outputs   |       images          |  images attributes  |       big data      |
 examples  |reduce noise,sharpening| contours , edges    |    image analysis   |
           ---------------------------------------------------------------------
        b. Sampling and quantization. With samples.
              Sampling     : Digitizing the coordinate values.
              Quantization : Digitizing the amplitude values.
          ----------------------------------------------------------------------
          |            (discrete)           |         (continuous)             |
          |                                 | PS : expect no distance brackets |
          |                             ____|                                  |
          |                           _|    |                                  |
          |                    ______|      |                                  |
          |              _____|             |        _____________             |
          |         ____|                   |      (               )           |
          |    ____|                        |    (                   )         |
          |  _|                             |   (                     )        |
          |_|_______________________________|__(_______________________)_______|
          |                                 |                                  |
          ----------------------------------------------------------------------
          
          
          
          
          
          
        c. Given image f of type uint8, what the difference between double(f) 
        and im2double(f).
          double - only converts the array type to double, keeping same values.
          im2double - also normalises to an interval of [0, 1].
             [ which is convenient when working with e.g., imshow() ]
             
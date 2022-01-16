# How to use
## Storyboard 
Set a placeholder for intrinsic size like below, as the overridden intrinsic size is calculated at run time, not working at Interface Builder.

<img width="254" alt="placeholder for intrinsic size" src="https://user-images.githubusercontent.com/14970271/149664107-7b193fbe-da49-415b-9908-fa76d74a2b9c.png">

## Auto layout programmatically
In an Auto Layout environment, the text field or text area’s preferred height will be reflected in `-intrinsicContentSize`. So just set the position of it. 

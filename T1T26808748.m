% MATLAB COURSEWORK 2023
%=========================================================================
% Using comments
%=========================================================================
% A comment must always start after a % symbol
% Matlab ignores comments and doesn't try to run them
% A comment can start on a new line or at the end of a line of code
% Comments can be used to 'stop' a line of code from executing e.g.
% a = 2*b+c   will now be ignored by Matlab
% Comments are included to explain processes and code steps
% Comments are essential to convey information to others
% Multiple lines of comments can be written in a comment block using %{ %}
%{
notice the small grey box and line appears surrounding the comment block
the % symbol is not needed at the start of each new line
any code in the comment block is ignored by Matlab so we can use the
comment block to stop several consecutive lines of code from executing
a = 3
b = 4
c = b^2-2*a*b
information in the comments is really useful to us!
%}
%=========================================================================
%Now look at the example code below (as referred to in Task 1 step 1 in the assessment task sheet)
%=========================================================================

%//////////////////////////////////////////////////
%////////// Task 1 (Step 1) Example code /////////
%//////////////////////////////////////////////////

% Uncomment and run the code block below

%{
figure('Name', 'Colour image example')

JcounterStr = 'j = ';

ColourArray = uint8(zeros(100, 100, 3)); %[1] refer to coursework question 1

for j = 1:100 %[2] refer to coursework question 2
   
    Jcounter = num2str(j); %[3] refer to coursework question 3
    
    figureTextJ = {[JcounterStr Jcounter]}; %[4]refer to coursework question 4
    
    
    ColourArray(j,1:50,2) = 255-2*(j-1); %[5] refer to coursework question 5
    
    Greenvalue = num2str(255-2*(j-1));
    GreenValueStr = 'green ';
    figureTextGreen = {[GreenValueStr Greenvalue]};
    
    imshow(ColourArray) %[6] refer to coursework question 6
    
    text(-40,j,figureTextJ,'FontSize',10);

    text(105,j,figureTextGreen,'FontSize',10);
    
    pause(0.1); %[7] refer to coursework question 7
    
end

%}


%=========================================================================
% The code for your courework can be written in the spaces provided below
%=========================================================================

%//////////////////////////////////////////////////
%//////// CW Task 1: Write your code below ////////
%//////////////////////////////////////////////////


% creates array of white pixels
A = logical(zeros(100));
A(A==0)=1;

% j string variable (for row counter) initialised
JcounterStr = 'j = ';

% displays figure
figure('Name','Binary images')
subplot(2,2,1)

for j = 1:100
    % iteration counter number
    Jcounter = num2str(j);
    figureTextJ = {[JcounterStr Jcounter]};

    % top left triangle (the conditional statement iterates j columns to
    % the right and 1:(51-j) rows down)
    if j<=50
        A(j, (1:(51-j))) = 0;        
    end

    % square (the conditional statement iterates from the 26th to 50th column
    % and 76th to 100th row)
    if j<=25
        A(76:100, (25+j)) = 0;
    end

    % middle triangle (the conditional statement iterates from the 51st to
    % 75th column and from the 51st to 75th row simultaneously)
    if j<=25
        A((50+j), (75-(25-j)):75) = 0;
    end

    % bottom left triangle (the conditional statement iterates from the 1st
    % to 15th column and 86th to 100th row simultaneously)
    if j<=15
        A(((85+j):100), j) = 0;
    end
    
    % bottom right triangle (the conditional statement iterates from the
    % 100th to 86th column and 86th to 100th row simultaneously)
    if j<=15
        A((101-j), (85+j):100) = 0;
    end
    
    % displays row counter with a pause of 0.01
    imshow(A)
    text(-40,j,figureTextJ,'FontSize',10);
    pause(0.01);
end

% displays number of black pixels
black_pixels = num2str(numel(A(A==0)));
black_pixels_text = {['Number of black pixels: ' black_pixels]};
text(-10,125,black_pixels_text,'FontSize',10);

% displays number of black pixels on and below the diagonal from (1,1) to
% (100,100)
black_pixels_diagonal = 0;
for i = 1:100
    for y = i:100
        if A(y, i) == 0
            black_pixels_diagonal = black_pixels_diagonal + 1;
        end
    end
end

black_pixels_diagonal_string = num2str(black_pixels_diagonal);
black_pixels_diagonal_text = {['Number of black pixels on and below the diagonal from (1,1) to (100,100): ' black_pixels_diagonal_string]};
text(-10,140,black_pixels_diagonal_text,'FontSize',10);


%//////////////////////////////////////////////////
%//////// CW Task 2: Write your code below ////////
%//////////////////////////////////////////////////

%{

% displays figure
figure('Name','Binary images')
subplot(2,2,2)

% creates uint8 array of zeros (100*100)
colourarray = uint8(zeros(100, 100, 3));

% j string variable for row counter initialised
JcounterStr = 'j = ';

for j = 1:100
    % iteration counter number initialised
    Jcounter = num2str(j);
    figureTextJ = {[JcounterStr Jcounter]};

    % green triangle (conditional statement iterates from the 1st to 100th
    % column and 100-(100-j) rows down simultaneously, assigning a green 
    % gradient of 255-2*(j-1) to the pixel each time)
    if j<=100
        colourarray((100-(100-j)), j:100, 2) = 255-2*(j-1);
    end
    
    % blue triangle (conditional statement iterates from 1st to 50th column
    % and (100-j):100 rows down, assigning a blue value of 200 to every pixel)
    if j<=50
        colourarray((101-j):100, j, 3) = 200;
    end
    
    % red triangle (conditional statement iterates from 1st to 100th row
    % and j+1:(100-j) columns down, assigning a red gradient of 253-2*(j-1)
    % to the pixel each time
    if j<=50
        colourarray(j+1:(100-j), j, 1) = 253-2*(j-1);
    end
    
    % greyscale triangle (conditional statement iterates from the 100th to
    % 51st column and 100-(50-j):(100-j) rows, assigning a greyscale value 
    % of 135+5*(j)
    if j<=50
        colourarray(101-j, 100-(50-j):(100-j), 1:3) = 135+5*(j);
    end
    
    % shows updated image with every iteration with a pause of 0.01 between
    % each iteration
    imshow(colourarray)
    text(-40,j,figureTextJ,'FontSize',10);
    pause(0.01);
end

%}

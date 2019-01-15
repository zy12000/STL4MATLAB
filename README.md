# STL FOR MATLAB
STL is a file format native to the stereolithography CAD software created by 3D Systems. STL has several after-the-fact backronyms such as "Standard Triangle Language" and "Standard Tessellation Language". This project is a simple implementation for Matlab to read or write binary stl files. Triangle model can be rendered by patch function in Matlab. 
## Binary STL
Because ASCII STL files can become very large, a binary version of STL exists. A binary STL file has an 80-character header (which is generally ignored, but should never begin with "solid" because that may lead some software to assume that this is an ASCII STL file). Following the header is a 4-byte little-endian unsigned integer indicating the number of triangular facets in the file. Following that is data describing each triangle in turn. The file simply ends after the last triangle.

Each triangle is described by twelve 32-bit floating-point numbers: three for the normal and then three for the X/Y/Z coordinate of each vertex – just as with the ASCII version of STL. After these follows a 2-byte ("short") unsigned integer that is the "attribute byte count" – in the standard format, this should be zero because most software does not understand anything else.

Floating-point numbers are represented as IEEE floating-point numbers and are assumed to be little-endian, although this is not stated in documentation.

    UINT8[80] – Header
    UINT32 – Number of triangles
    foreach triangle
        REAL32[3] – Normal vector
        REAL32[3] – Vertex 1
        REAL32[3] – Vertex 2
        REAL32[3] – Vertex 3
        UINT16 – Attribute byte count
    end
--From wikipedia

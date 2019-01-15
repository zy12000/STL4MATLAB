function [stl_struct]=stlreader(filename)
fileID=fopen(filename,'r');
stl_struct.header=fread(fileID,[1,80],'*char');
num_facets=fread(fileID,1,'ulong');
stl_struct.vertices=zeros(num_facets*3,3);
stl_struct.normals=zeros(num_facets,3);
stl_struct.faces=reshape(1:num_facets*3,3,num_facets)';
for i=1:num_facets
    stl_struct.normals(i,:)=fread(fileID,[1,3],'float');
    stl_struct.vertices(i*3-2:i*3,:)=fread(fileID,[3,3],'float')';
    fread(fileID,1,'ushort');
end
fclose(fileID);
function stlwriter(filename,stl_struct)
fileID=fopen(filename,'w');
header=repmat(' ',1,80);
header(1:28)='Generated from Matlab by Zy.';
fwrite(fileID,header,'char*1');
num_facets=size(stl_struct.faces,1);
fwrite(fileID,num_facets,'ulong');
for i=1:num_facets
    v=stl_struct.vertices(stl_struct.faces(i,:),:)';
    if isfield(stl_struct,'normals')
        fwrite(fileID,stl_struct.normals(i,:),'float');
    else
        fwrite(fileID,[0,0,0],'float');
    end
    fwrite(fileID,v(:),'float');
    fwrite(fileID,i-1,'ushort');
end
fclose(fileID);
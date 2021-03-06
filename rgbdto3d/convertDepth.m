%% convert mat depth map to text data file
% depth map export to binary file
% plus camera pose matrix to text file

data_dir = 'F:\test\fire_processed_new\';

start_id = 10;
end_id = 125;

imgw = 640;
imgh = 480;


for i=start_id:end_id
    
    % load depth image
    cur_dfile = [data_dir num2str(i) '_depth.mat'];
    cur_dmap = load(cur_dfile);
    cur_dmap = cur_dmap.refinedDepth;
    imshow(cur_dmap)
    
    % output to text file
    save_dfile = [data_dir num2str(i) '_depth.bin'];
    fid = fopen(save_dfile, 'w');
    fwrite(fid, cur_dmap', 'single');
    fclose(fid);
    %save(save_dfile, 'cur_dmap', '-ascii');
    
    % load w2c
    cur_cfile = [data_dir num2str(i) '_w2c.mat'];
    cur_cmat = load(cur_cfile);
    cur_cmat = cur_cmat.m;
    % output to text file
    save_cfile = [data_dir num2str(i) '_w2c.txt'];
    save(save_cfile, 'cur_cmat', '-ascii');
    
    disp(['Finish ' num2str(i)]);
    
end

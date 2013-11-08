//////////////////////////////////////////////////////////////////////////
// segmentor for an object in a video clip
// jiefeng@2013-11-07
//////////////////////////////////////////////////////////////////////////


#pragma once

#include "ObjectSegmentor.h"


namespace rgbdvision
{
	class VideoObjSegmentor
	{
	private:

		std::vector<cv::Mat> frames;
		std::vector<cv::Mat> fgMasks;
		visualsearch::ObjectSegmentor obj_segmentor;

		// bounding box of all mask points
		bool MaskBoundingBox(const cv::Mat& mask, cv::Rect& box);

		// enlarge box by ratio for width and height
		bool ExpandBox(const cv::Rect oldBox, cv::Rect& newBox, float ratio, int imgWidth, int imgHeight);

		bool OutputMaskToFile(ofstream& out, const cv::Mat& color_img, const cv::Mat& mask, bool hasProb = false);

	public:
		VideoObjSegmentor(void);

		bool LoadVideoFrames(const string& frame_dir, int start_id, int end_id);

		bool DoSegmentation(const string& frame_dir, int start_id, int end_id);
	};
}


